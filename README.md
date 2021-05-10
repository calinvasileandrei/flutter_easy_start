# flutter_easy_start

Hello, my name is Andrew and I develop this easy starter project which you can use to set up your initial project.

How it works?
After having intalled the cli on your computer,

### Automatic Setup using the cli
Download the cli executable from my repository: https://github.com/calinvasileandrei/flutter_easy_cli/tree/master/executable ,
you can also build it by your self if you want, clone the project, install all the requirements and from the console execute:
  - `pyinstaller flutter_easy_cli.py --onefile`
This process will give you the same file.

After you have downloaded the cli you can use it or by moving the file in to the directory you want to create the project (worst alternative) or export the path of the file for your shell.

For MacOS should be something like this:
  `export PATH="$PATH:/Users/YOURNAME/PATH/TO/THE/FILE"`

Now you can use the cli from everywhere in your computer by typing flutter_easy_cli.

### Manual Setup
Simple, create a new flutter project normally as you are used to,
  1) clone this project and replace your lib folder with this one.
  2) Then copy the assets folder inside your project.
  3) Replace your pubspec.yaml file with the pubspec in the easy starter project, remember to change the name with your app name.
  4) Replace the .env file and update it with your backend url marked as: `BACKEND_URL=https://yourbackend.com/` 
  5) Fix all the errors inside the lib folder relative to the project name, simply right click the lib folder and find the usage of flutter_easy_starter and replace     with your project name
  6) If the test file gives your error replace also there the package name.

#### Now you are good to start :)

My current backend returns for the login a json object with the user (check the model for further details) and a token (JWT Token).

I hope i will release a cli/executable to do all this tasks automatically.

If you want to help this project or do you have any idea let me know :)



Calin Vasile Andrei
