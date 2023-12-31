.. _application:

Describing your Application
***************************

.. raw:: html

   <object id="TOC" data="graphical-toc.svg" type="image/svg+xml"></object>
   <script>
   window.onload=function() { // Wait for the SVG to be loaded before changing it
     var elem=document.querySelector("#TOC").contentDocument.getElementById("ApplicationBox")
     elem.style="opacity:0.93999999;fill:#ff0000;fill-opacity:0.1;stroke:#000000;stroke-width:0.35277778;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1";
   }
   </script>
   <br/>
   <br/>

Every SimGrid simulation entails a distributed application, that
virtually executes on the simulated platform. You can express this
application using one of the following interfaces. It is even possible
to mix several interfaces in the same simulation.

 - :ref:`Describing Algorithms with the S4U interface <S4U_doc>` (in C++ or Python)
 - :ref:`Simulating existing MPI programs with the SMPI toolsuite <SMPI_doc>`
   (in C, C++, or Fortran)
 - In some cases, you may want to replay an execution trace in the simulator. This
   trace lists the events of your application or of your workload, and
   your application is decomposed as a list of event handlers that are
   fired according to the trace. SimGrid comes with a built-in support
   for MPI traces (with solutions to import traces captured by several
   MPI profilers). You can reuse this mechanism for any kind of trace
   that you want to replay, for example to study how a P2P DHT overlay
   reacts to a given workload.
 - A prototypal tool is intended to allow the modification of any existing
   application so that it can run on top of SimGrid. This project,
   called `Remote-SimGrid
   <https://framagit.org/simgrid/remote-simgrid>`_, is somewhat
   experimental but should be already usable.

As you can see, SimGrid is very modular and can be used in many
ways. We are working to improve it along two main directions. First,
we plan to further increase the modularity of the simulator so that
users can invent the specific API or DSL they need for their usage. We
call this project BYOS: Build Your Own Simulator.

Executing existing applications within the simulator is another
long-term goal. SMPI and Remote-SimGrid already allow you to execute some
applications, but our long term goal would be to allow for the execution
of any legacy application, with absolutely no modification. We call it
SimOS, even if it will not become usable before several years of
additional work.
