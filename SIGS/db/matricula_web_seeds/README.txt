This folder contains the code necessary to populate the applications database with
information gathered from MatriculaWeb.

How does it work?

UnB's CPD provided some an API with some informations from disciplines, buildings,
allocations, etc. All of the data gathering is available in a module called MatriculaWeb.

The module lives in lib/matricula_web.rb

Only the Seeder class should be used in the code. The Requester is an inside class with
helper utilities to Seeder class's methods.

To run this seed, simply execute 'rake seedfrommw' in a terminal.

It is important that the order of the seeding process is followed, that's why the files
start with a number (the bigger a number is, lastly the file will be executed).

To implement new endpoints, go to lib/matricula_web.rb, create a new method in Seeder class and
use it to gather data.