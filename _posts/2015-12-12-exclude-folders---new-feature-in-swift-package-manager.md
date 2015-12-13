---
layout: post
title: "Exclude folders - New feature in SPM"
categories:
published: true
---

#### [Download examples](/code/2015-12-12-exclude-folders---new-feature-in-swift-package-manager/Package.zip)

Swift Package Manager got a [New Feature](https://github.com/apple/swift-package-manager/pull/57)! Yea! Hurray! 🙌👯🍾🎉🐣🎉  
But why we needed it? Let's see ... 

## The Problem
Let's have a look on this folder structure

```
Package
├── LibA
│   └── A.swift
├── LibB
│   └── B.swift
├── Tools
│   └── Tools.swift
```
Now we run `swift-build` and get the follow result:

```
.build
├── LibA.a
├── LibB.a
├── Tools.a
```
So, the problem here is that I don't want to generate a target for a `Tools` folder. I want to exclude it. Let's do that, it've very easy.

## Exclude folders
Open `Package.swift` file and declare exclude folders for your package.

```swift
import PackageDescription

let package = Package(
    exclude: ["Tools"]
)
```

That's it!🎉 Now just clean cached `.build` folder and build the package again. Not it creates only 2 targets `LibA.a` and `LibB.a`

### Some rules to remember:

 - You can exclude many folders.  
 	`["A", "B"]`
 - Also you can specify path to a nested folder.  
 	`["A\subFolder"]`
 - The names are case-sensitive.  
 	(`"Tools" != "tools"`)

```swift
import PackageDescription

let package = Package(
    exclude: ["Tools", "someOther", "Lib/code/Old"]
)
```

The paths specified in the `exclude` are relative to the Root folder of the package. This means that the example above would exclude these folders:
 
```
Package
├── Tools
├── someOther
├── Lib
│   └── code
│       └── Old
```

**P.S**  
To use that feature you need use latest version of a `swift-build` from[ master branch](https://github.com/apple/swift-package-manager).  

- Clone the repo, 
- Build `swift-build` tool by running `./Utilities/bootstrap`
- Opne `.build/debug` folder
- Run it - `./swift-build --chdir PackagePathToBuild`   
   Example: `./swift-build --chdir /Users/kostiantyn/HelloSPM`