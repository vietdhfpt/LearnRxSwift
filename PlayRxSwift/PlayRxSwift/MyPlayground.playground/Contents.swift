import UIKit
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

// - Observable and observer
func defineObservableAndObserver() {
    // OBSERVABLE
    let observable = Observable<String>.create { observer -> Disposable in
        DispatchQueue.global(qos: .default).async {
            Thread.sleep(forTimeInterval: 10)
            observer.onNext("Hello dummy")
            observer.onCompleted()
        }
        
        return Disposables.create()
    }
    
    // OBSERVER
    observable.subscribe(onNext: { element in
        print(element)
    })
    .disposed(by: disposeBag)
}

defineObservableAndObserver()

let obser = Observable.of(1, 2, 3, 4, 5, 6)

let observable = Observable<String>.create { (observer) -> Disposable in
    observer.onNext("Merge: ")
    return Disposables.create()
}

