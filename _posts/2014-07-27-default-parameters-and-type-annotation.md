---
layout: post
title: "Default Parameters and Type Annotation"
categories:
published: true
---

Swift support default Default Parameter for functions
> You can define a default value for any parameter as part of a function’s definition. If a default value is defined, you can omit that parameter when calling the function.  

Quick simple example
{% highlight objc %}
class Car {
    func drive(nitro: Bool = false) {
        println("Drive. Use nitro: \(nitro)")
    }
}

class RaisingCar : Car {
    override func drive(nitro: Bool = true) {
        println("Drive. Use nitro: \(nitro)")
    }
}

let car = Car()
car.drive()
//Drive. Use nitro: false

let raising = RaisingCar()
raising.drive()
//Drive fast. Use nitro: true
{% endhighlight %}

This is pretty easy example. We don't provide any argument to the function so default value is used.  
Let's try this one  

{% highlight objc %}

let rasing2: Car = RaisingCar()
rasing2.drive()
//Drive fast. Use nitro: false
{% endhighlight %}

The result is `Drive fast. Use nitro: false`.  
What happens here is: 

1. Because of polymorphism ` RaisingCar ` drive function is being called  
2. But it's called with `false` default parameter. This happens because swift binds default parameters statically. The static type of rasing2 variable is Car, because we have specified it.    
  
Thanks to **Airspeed Velocity** about [Great post](http://airspeedvelocity.net/2014/06/12/default-parameters-in-swift-are-statically-bound/)


