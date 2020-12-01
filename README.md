## Usaing
```
pod 'ChainOneKit-Swift', :git => 'https://github.com/CommunityChain/ChainOneKit-Swift.git', :tag => '0.1.1.1'
```

```
git tag --list
0.0.1
0.0.10
0.0.5
0.0.6
0.0.7
0.0.8
0.0.9
0.0.9.1
0.1.1.1
```


## 关于三方库中访问修饰符的限定

* 对于Foundation库、UIKit库等库中的类进行扩展时，有2种修饰方式：
 1. extension使用public修饰，内部对外的方法(class方法、static方法、实例方法)和计算属性默认为public类型，无需再次添加public修饰；
 2. extension不作任何修饰，内部对外的方法和计算属性使用public修饰；

* 自定义的类
 1. class需使用public修饰，且内部的class类型或static类型的也需使用public修饰；
 2. ...

 
* 类本身的权限作为内部的默认权限？ 

* open的使用

* 导入问题
```
ChainOneKit库每次使用需单独导入的问题解决
该问题待确认，但目前Constant.swift和XDPackageTimer.swift是需要单独引入该库的;
但对于extension之类的无需再次导入
```






pod-template
============

An opinionated template for creating a Pod with the following features:

- Git as the source control management system
- Clean folder structure
- Project generation
- MIT license
- Testing as a standard
- Turnkey access to Travis CI
- Also supports Carthage

## Getting started

There are two reasons for wanting to work on this template, making your own or improving the one for everyone's. In both cases you will want to work with the ruby classes inside the `setup` folder, and the example base template that it works on from inside `template/ios/`. 

## Best practices

The command `pod lib create` aims to be ran along with this guide: https://guides.cocoapods.org/making/using-pod-lib-create.html so any changes of flow should be updated there also.

It is open to communal input, but adding new features, or new ideas are probably better off being discussed in an issue first. In general we try to think if an average Xcode user is going to use this feature or not, if it's unlikely is it a _very strongly_ encouraged best practice ( ala testing / CI. ) If it's something useful for saving a few minutes every deploy, or isn't easily documented in the guide it is likely to be denied in order to keep this project as simple as possible.

## Requirements:

- CocoaPods 1.0.0+
