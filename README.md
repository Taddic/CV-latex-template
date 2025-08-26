# CV-latex-template
A nice looking CV template written by me using Latex.

Inspired by various CV layputs, and some minor code stuff taken from [simple-hipstercv](github.com/latex-ninja/simple-hipstercv/blob/master/simplehipstercv.sty#L202). 
Code snippets taken from the web is indicated in the documentation where they are used in [ProCV class file](procv.cls)

## Usage
Put one of the following code blocks in your .tex file preamble.
You can just edit the [example.tex](example.tex) for your own CV.

Purple theme
```
\documentclass[purpleprocv]{procv}
```
Orange theme
```
\documentclass[orangeprocv]{procv}
```
Green theme
```
\documentclass[greenprocv]{procv}
```
Gray theme
```
\documentclass[grayprocv]{procv}
```

## Install
1. Install latex either manually or by using the supplied [install.sh](install/install.sh) script file.
2. The files procv.cls and procv.sty needs to be in the folder with your own CV tex file.
3. Use the [example.tex](example.tex) as a starting point if you want.

## Compilation
Either use the supplied makefile, or use the Visual Studio code settings below.

### Makefile
Build everything
```
make
```
Show pdf
```
make show
```
Clean build files
```
make clean
```
Clean pdf files
```
make clean-pdf
```

### Visual Studio Code 
1. Install extension from VSCode. (https://github.com/James-Yu/LaTeX-Workshop)
2. Add the settings in [settings.json](install/settings.json) in this repo to the settings.json for VSCode


## Examples
![Purple CV](exampleImages/purpleprocv.jpg 'Purple CV')
![Green CV](exampleImages/greenprocv.jpg 'Green CV')
![Orange CV](exampleImages/orangeprocv.jpg 'Orange CV')
![Gray CV](exampleImages/grayprocv.jpg 'Gray CV')