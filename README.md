## Stack class for Swift
I found that swift does not had Stack in Foundation
So I try to implement that for my self.

### Use

There is three version of Stack: 

`StackG` is Generic version Stack.It uses struct;

`Stack` is class version Stack,It seems more like common Stack,which needs to check the type of value before you use it.

`PriorityStack` is struct version Stack that auto sort elements as DESC

They are all implemented with `Sequence`, so you can use `.map`, `.flat`, `for-in` and so on. :)

### Demo

See `main.swift`.

## MIT License (MIT)

The MIT License (MIT)

Copyright (c) 2015-2016 R0uter

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
