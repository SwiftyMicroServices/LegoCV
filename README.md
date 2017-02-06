# LegoCV

Fully functional OpenCV wrapper for Objective-C and Swift to eliminate the need to use Objective-C++ and allow full compatibility with Swift projects.

## Mission

Swift is one of the fastest evolving languages, but there is no way to use C++ frameworks directly, as it could be with Objective-C/C++.

This project's purpose is to create a simple, easy to use native Swift framework for OpenCV. The project adds Swift and Objective-C convenience methods, but translates to OpenCV API entirely.

The idea is to simply wrap OpenCV native C++ classes into Objective-C classes, which are then natively bridged to Swift, providing a thin layer on top of native OpenCV. [Realm]() and [EmguCV]() in C# use similar framework structure.

## Example

The following examples display the difference in using LegoCV in Swift and Objective-C versus vanilla OpenCV in C++.
The example is extracted from Face detection sample code, shipped with LegoCV. On iOS it uses `OCVVideoCamera` class to get image stream from camera (wraps original `CvVideoCamera`, to keep backward compatibiliy).

Swift (LegoCV):
```swift
let faceDetector = OCVCascadeClassifier();
faceDetector.load(path: "haarcascade_frontalface_alt2.xml")

func process(image: OCVMat) {
    let scale = 2.0

    var minSize = OCVSize()
    minSize.width = 30
    minSize.height = 30
        
    let gray = OCVMat()
    let smallImage = OCVMat(rows: Int(round(Double(image.rows) / scale)), cols: Int(round(Double(image.cols) / scale)), type: .cv8U, channels: 1)
        
    OCVOperation.convertColor(fromSource: image, toDestination: gray, with: .typeBGR2GRAY)
    OCVOperation.resize(fromSource: gray, toDestination: smallImage, size: smallImage.size, fx: 0, fy: 0, interpolation: .linear)
    OCVOperation.equalizeHistogram(fromSource: smallImage, toDestination: smallImage)
    
    // Faces are returned as OCVRect instances, so they are mapped in Swift, as they are structs.
    let faces : [OCVRect] = faceDetector.detectMultiscale(with: smallImage, scaleFactor: 1.1, minNeighbours: 2, flags: 0, minSize: minSize).map { $0.rect }
}
```

Objective-C (LegoCV with Objective-C):
```objectivec
- (void)setupClassifier {
    self.faceDetector = [[OCVCascadeClassifier alloc] init];
    [self.faceDetector loadPath:@"haarcascade_frontalface_alt2.xml"];
}

- (void)processImage:(OCVMat *)image {
}
```

C++ (OpenCV):
```cpp
void setup () {
    _faceDetector = new CascadeClassifier();
    _faceDetector->load("haarcascade_frontalface_alt2.xml");
}

void processImage(cv::Mat img) {
    double scale = 2.0;
    Mat gray, smallImg( cvRound (img.rows/scale), cvRound(img.cols/scale), CV_8UC1 );
    
    cvtColor( img, gray, COLOR_BGR2GRAY );
    resize( gray, smallImg, smallImg.size(), 0, 0, INTER_LINEAR );
    equalizeHist( smallImg, smallImg );

    cv::Size minSize(30,30);

    vector<cv::Rect> faceRects;

    // Faces are returned in provided faceRects vector
    self->_faceDetector->detectMultiScale(smallImg, faceRects, 1.1, 2, 0, minSize);
}
```

## Documentation

As this is a project in progress, documentation will be added to [Wiki]().

## Performance

There is a smaller performance impact compared to pure native C++ code of OpenCV, due to Objective-C messaging system. If you need a high performance code, it is still recommended to write the algorithm in C++ and add bridges to LegoCV or Objective-C.

## Installation

LegoCV can be installed with CocoaPods or Carthage.

# License

BSD license, respect [OpenCV](https://github.com/opencv/opencv) license as well.
