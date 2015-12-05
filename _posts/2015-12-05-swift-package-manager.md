---
layout: post
title: "Swift Package Manager"
categories:
published: true
---
#### [Download examples](/code/2015-12-05-swift-package-manager/package-manager-examples.zip)

Swift is Open-Source now 👏🎉, here [Swif§t.org](https://swift.org) and here [GitHub](https://github.com/APPLE). The are a lot of amazing stuff there, but now I want to look at [Swift Package Manager](https://github.com/apple/swift-package-manager). Fist install [Swift 2.2 Toolchains](https://swift.org/getting-started/#installing-swift). When you run `swift --version` you should see

```
Apple Swift version 2.2-dev (LLVM 46be9ff861, Clang 4deb154edc, Swift 778f82939c)

```
With **Swift Package Manager** (in future will use **SPM** abbreviation) you can build swift code into Modules and manages dependency.  
To build a package with **SPM** simple run `swift build`

The Swift Package Manager follow a convention-based approach. It means that you need to follow some rules to make it work. Here are they:

## 1. Manifest file
A package must have a `Package.swift` manifest file in root directory.   

```
project/Package.swift
```
In this manifest file you can specify your package settings and dependencies. 
If you follow the convention, it can be empty, **but it must exist**.
 
## 2. Source folder
We need to organise source code in a special way. Allowed rules:

 - No folder
 - *Source* folder
 - Any other folders

**1. No folder**    
Put your source code directly to root folder.

```
project/Package.swift
project/main.swift
project/hi.swift
```
*Result*: SPM, `swift build` creates a single `project` Module

**2. `Source` folder**  
The source files for a module should be located in `Sources` folder.   
`Sources`, `Source`, `srcs` or `src` names are allowed.

```
project/Package.swift
project/Source/main.swift
project/Source/hi.swift
```
*Result*: A single `project` Module, same as above.

Only 1 `Sources` folder is allowed. You can't create `Source` and `src` folders in your root folder.  
The Source folder can contain subfolder. Every subfolder is treated as a Module

```
project/Package.swift
project/Source/Tool/main.swift
project/Source/LibA/code.swift
project/Source/LibB/hi.swift
```
*Result*: This creates 3 Modules: `Tool`, `LibA` and `LibB`.  

❗️ Use Source folder. This is preferred solution and we see that [Swift team suggest](https://swift.org/getting-started/#using-the-build-system) to follow it.  
 
**3. No folder**   
If there is no `Sources` folder (or `Sources`, `srcs`, `src`) in root directory, any other folders are treated as a Module with source files.

```
project/Package.swift
project/a/main.swift
project/b/hi.swift
project/c/man.swift
```
*Result*: This creates 3 Modules: `a`, `b` and `c`.  
 
## 3. Module Type

-  Executable
-  Library

If a module contains `main.swift` file SPM will produce executable module (command line tool), in other case it will make a library module. 
 
```
project/Package.swift
project/Executable/main.swift
project/Lib/hi.swift
```


