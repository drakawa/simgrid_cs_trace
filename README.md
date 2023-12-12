# simgrid3.35_trace

## Dokcerのbuild

- コマンド
```
docker-compose up --build -d
```

## replayのmake
以下、コンテナ内のシェルでの作業

- コマンド
```
cd ~/workspace/eval_trace/replay/
smpicxx -std=c++17 ./replay.cpp -O3 -o ./smpi_replay
```

## 各入力ファイルの準備
### トラフィック行列
- traf_matrixの下に（例として16x16の) タブで区切られた行列を.txt形式で保存
- 複数のtxtファイルを保存することで、一括評価可能 (後述)
```
ls ~/workspace/eval_trace/traf_matrix/
gen_probmat.py  matrix_16.txt  matrix_16_1.txt  matrix_16_2.txt
cat ~/workspace/eval_trace/traf_matrix/matrix_16_1.txt
0.069145        0.119434        0.000019        0.050129        0.024333        0.015310        0.030883        0.057296        0.065787        0.089339        0.069505        0.113614        0.033899        0.145597 0.004541        0.111168
0.055259        0.073981        0.018590        0.026232        0.106034        0.128217        0.041503        0.091677        0.116051        0.118463        0.011262        0.005172        0.022489        0.116283 0.013023        0.055763
0.102469        0.057035        0.074013        0.033752        0.073438        0.089283        0.001956        0.080246        0.105782        0.080034        0.030000        0.084432        0.011042        0.047913 0.097196        0.031409
0.049849        0.022524        0.003355        0.117588        0.036658        0.045998        0.085150        0.009243        0.099449        0.025416        0.102080        0.121212        0.017726        0.071723 0.120284        0.071744
0.005810        0.062326        0.077200        0.059882        0.109858        0.068217        0.105067        0.015989        0.016198        0.093901        0.046250        0.019231        0.107871        0.040446 0.087321        0.084435
0.096133        0.067876        0.081727        0.037972        0.029377        0.097502        0.046590        0.105006        0.072204        0.067661        0.012488        0.103336        0.048965        0.062948 0.044419        0.025796
0.104210        0.066177        0.000331        0.071191        0.037680        0.060799        0.102198        0.041213        0.104805        0.071908        0.001825        0.107216        0.079699        0.115047 0.019880        0.015819
0.115450        0.086262        0.008170        0.093522        0.093326        0.114265        0.088083        0.015384        0.002461        0.003245        0.003504        0.030480        0.106467        0.066704 0.068436        0.104239
0.017124        0.038500        0.080777        0.133708        0.077367        0.002571        0.110408        0.032127        0.111301        0.053486        0.119083        0.103029        0.076706        0.018817 0.008263        0.016733
0.006307        0.015218        0.031955        0.100941        0.079241        0.001778        0.010190        0.136941        0.080428        0.028781        0.035723        0.105306        0.027668        0.082305 0.137329        0.119889
0.031346        0.064531        0.081023        0.108341        0.020491        0.002428        0.009151        0.063561        0.079242        0.074344        0.041477        0.129204        0.075768        0.049681 0.072004        0.097409
0.099789        0.039502        0.009891        0.055183        0.093897        0.031339        0.112243        0.009921        0.038816        0.119997        0.028843        0.095350        0.078234        0.137898 0.039260        0.009835
0.071679        0.075298        0.088524        0.090880        0.001360        0.022853        0.060144        0.092542        0.092655        0.054281        0.089284        0.062561        0.038031        0.047391 0.058928        0.053588
0.125084        0.124078        0.053329        0.130092        0.023493        0.017061        0.018243        0.068292        0.002907        0.128027        0.111705        0.002028        0.023796        0.044846 0.017692        0.109325
0.036190        0.098691        0.061099        0.092258        0.088679        0.095047        0.048277        0.057355        0.083836        0.029994        0.051466        0.062894        0.001631        0.062303 0.045527        0.084755
0.034255        0.097023        0.062791        0.019995        0.085618        0.066505        0.005858        0.045659        0.073789        0.099817        0.000044        0.106137        0.040920        0.105814 0.065710        0.090064
```

### サーキットの接続パターン
- cs_edgesの下にスペースで区切られたノード対を.edges形式で保存
- 複数のedgesファイルを保存することで、一括評価可能 (後述)
```
ls ~/workspace/eval_trace/cs_edges/
cs_empty.edges  gen_randcs.py  randcs_16.edges  randcs_16_1.edges  randcs_16_2.edges
cat ~/workspace/eval_trace/cs_edges/randcs_16_1.edges
3 13
7 2
6 10
4 1
14 0
15 9
8 12
11 5
```

### リンク設定
- 設定ファイル: link_config.yaml
  - ホスト-ルータ間 (HR), ルータ-ルータ間 (RR), サーキット接続されたルータ-ルータ間 (cs) それぞれについて、
  - 帯域 (bw [Bps]), 遅延 (lat [us]) を設定

```
cat ~/workspace/eval_trace/link_config.yaml
HR:
 bw: 200
 lat: 50
RR:
 bw: 100
 lat: 50
cs:
 bw: 100
 lat: 50
```

### 評価設定
- 設定ファイル: eval_config.yaml
  - rate (通信レート): トラフィック行列の各要素にrate値をかけた値 [Byte] が送受信ホスト間の通信量となる
  - dim: n-次元meshのサイズ (例: 4x4 の2次元meshの場合、[4,4] )
```
cat ~/workspace/eval_trace/eval_config.yaml
rate: 100000
dim:
 [4,4]
```

## 一括評価
- traf_matrix下のtxtファイル (トラフィック行列), cs_edges下のedgesファイル (サーキット接続) のすべてのパターン組に対し、
- link_config.yaml, eval_config.yamlの設定下でのシミュレーション時間 (時間が小さいほど性能が良い) をlogfilesに保存

- コマンド
```
python3 evalall_meshcs.py
```
- 実行例
```
cd ~/workspace/eval_trace/
ls cs_edges/*.edges
cs_edges/cs_empty.edges  cs_edges/randcs_16.edges  cs_edges/randcs_16_1.edges  cs_edges/randcs_16_2.edges

ls traf_matrix/*.txt
traf_matrix/matrix_16.txt  traf_matrix/matrix_16_1.txt  traf_matrix/matrix_16_2.txt

python3 evalall_meshcs.py
['matrix_16_1.txt', 'matrix_16.txt', 'matrix_16_2.txt']
['cs_empty.edges', 'randcs_16.edges', 'randcs_16_2.edges', 'randcs_16_1.edges']
smpirun -no-privatize -replay traf_matrix/matrix_16_1.txt_100000 --log=replay.thresh:critical --log=no_loc -np 16 -platform xmlfiles/link_config.yaml_4x4mesh_cs_empty.edges.xml ./replay/smpi_replay --log=smpi_config.thres:warning --log=xbt_cfg.thres:warning
[host8:14:(15) 0.005929] [smpi_replay/INFO] Simulation time 0.005929

smpirun -no-privatize -replay traf_matrix/matrix_16_1.txt_100000 --log=replay.thresh:critical --log=no_loc -np 16 -platform xmlfiles/link_config.yaml_4x4mesh_randcs_16.edges.xml ./replay/smpi_replay --log=smpi_config.thres:warning --log=xbt_cfg.thres:warning
[host11:3:(4) 0.003433] [smpi_replay/INFO] Simulation time 0.003433
...

ls logfiles/
matrix_16.txt_100000_link_config.yaml_4x4mesh_cs_empty.edges.xml.log     matrix_16_1.txt_100000_link_config.yaml_4x4mesh_randcs_16_1.edges.xml.log
matrix_16.txt_100000_link_config.yaml_4x4mesh_randcs_16.edges.xml.log    matrix_16_1.txt_100000_link_config.yaml_4x4mesh_randcs_16_2.edges.xml.log
matrix_16.txt_100000_link_config.yaml_4x4mesh_randcs_16_1.edges.xml.log  matrix_16_2.txt_100000_link_config.yaml_4x4mesh_cs_empty.edges.xml.log
matrix_16.txt_100000_link_config.yaml_4x4mesh_randcs_16_2.edges.xml.log  matrix_16_2.txt_100000_link_config.yaml_4x4mesh_randcs_16.edges.xml.log
matrix_16_1.txt_100000_link_config.yaml_4x4mesh_cs_empty.edges.xml.log   matrix_16_2.txt_100000_link_config.yaml_4x4mesh_randcs_16_1.edges.xml.log
matrix_16_1.txt_100000_link_config.yaml_4x4mesh_randcs_16.edges.xml.log  matrix_16_2.txt_100000_link_config.yaml_4x4mesh_randcs_16_2.edges.xml.log

cat logfiles/*
0.00541
0.002938
0.00362
0.003316
0.005929
0.003433
0.004566
0.003506
0.00549
0.003712
0.003539
0.0031
```

