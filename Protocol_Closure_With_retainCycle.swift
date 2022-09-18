/*
In swift accessing a self inside a closure makes the closure have strong reference to self.

A strong reference cycle can also occur if you assign a closure to a property of a class instance,
and the body of that closure captures the instance.


*/

//Exampe 1
//It has strong ref cycle
viewModel.articlesDidChange = { value in
    self.value = value
}

//solution1 
viewModel.articlesDidChange = { [weak self] value in
    self?.value = value
}


//solution2
viewModel.articlesDidChange = { [weak self] value in
    guard let self = self else {return}
    self.value = value
}

//Exampe 2

override func viewDidAppear(_ animated: Bool) {
     super.viewDidAppear(animated)
     let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: { _ in
         self.doSomething()
      }))
     present(alert, animated: true, completion: nil)
}

private func doSomething(){
}

/* The closure captures a reference type from its surrounding scope, 
the closure creates a strong reference to the captured instance. This increases the instance’s retain count, 
which means that the instance is still stored in the memory so we can add [weak self] to break the cycle. */

alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: {[weak self] _ in
     self?.doSomething()
}))


protocol SomeDelegate: AnyObject {
     func didTapthing()
}
class Foo: SomeDelegate{
     func didTapthing() {
     }
     init() {
          let vc = ViewController()
          vc.delegate = self
     }
}
class ViewController: UIViewController{
     weak var delegate: SomeDelegate?
}
