See the live example here: https://aroobaito.itch.io/biwascheme-playcanvas-example

A simple boilerplate example demonstrating BiwaScheme running on top of the 3D webGL engine PlayCanvas.

Special thanks to Yutaka Hara for this amazing implementation of Scheme, as well as the PlayCanvas developers for their fantastic frameworks, PCUI and PlayCanvas!

If you are new to BiwaScheme, feel free to check out the docs on the website at https://www.biwascheme.org

The most heavily commented Scheme file in this project is express-server.scm if you're completely lost.

You can e-mail me at AroobaitoArt@gmail.com or join the BiwaScheme mailing list at https://groups.google.com/g/biwascheme

Installation:

Everything needed to host the files on a web server/web host such as itch.io is already included and ready for upload immediately after pulling. In order to serve the static files yourself to your local host, an Express server written in BiwaScheme is also included, however note that this is not actually necessary to upload, it's strictly for your convenience while developing. You can easily host the static files some other way, such as with Python + Flask, Gauche Scheme + Makiki etc.

To run the BiwaScheme Express server, run "npm install -g express", then run "npm install -g biwascheme" in a command prompt or powershell.

Next, open the Scheme folder in a command prompt and run "biwas express-server.scm" and the server will be started on port 5000.
You can then go to http://localhost:5000/index.html in your web browser to view the project.
