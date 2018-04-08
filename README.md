This is a sample project to demonstrate a crash I found while using RxFlow (https://github.com/RxSwiftCommunity/RxFlow/issues/42).  It uses Cocoapods so all you should have to do to set it up is to install the dependencies and run.  Once the simulator's launched, click on "RxFlowTab"--in its initial state you should see a table view with a few cells.  To replicate the crash, go to `RxFlowViewController` and read the comments.

Crash details:
Attemping to call `Bundle(for: type(of: self))` at any stage of the `RxViewController` UIKit view loading lifecycle causes a crash if `NextFlowItems.one(...)` is returned in `ThirdTabFlow`.  `Bundle(for: RxViewController.self)` always works, as does hardcoding the framework bundle identifier: `Bundle(identifier: "com.blah.RxFlowTab")`.  It appears that under the above crash conditions calling `Bundle(for: type(of: self))` returns the path to the app instead of the path to the class.

The exception thrown is:

```
Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Could not load NIB in bundle: 'NSBundle </Users/Evian/Library/Developer/CoreSimulator/Devices/14B63B8D-20C5-40A1-A038-4556619127BF/data/Containers/Bundle/Application/536EC409-CA47-4AAE-B714-44A712420D45/TestRxFlow.app> (loaded)' with name 'RxTableViewCell''
```

Library versions:
RxCocoa 4.1.2
RxFlow 1.3.1
RxSwift 4.1.2
