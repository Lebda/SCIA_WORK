Test: typ0,wind0,cpe=1 {
  Inputs: {
    PrintCaption: False  ->  False
    Caption: uživatelský popis  ->  uživatelský popis
    w↓F←: -1970  ->  -1970
    w↓G←: -1070  ->  -1070
    w↓H←: -833  ->  -833
    w↓I←: 250  ->  250
    w↓J←: 250  ->  250
    w↓I,2←: 150  ->  150
    w↓J,2←: 150  ->  150
    Headline: True  ->  True
    c↓pe←: 1  ->  1
    typ: 0  ->  0
    wind: 0  ->  0
  }
  Results: {
    r↓1← = 1 == 1
    r↓2← = 0.8 == 0.8
    r↓3← = 0.6 == 0.6
    w↓F,1← = -1970 == -1970
    w↓G,1← = -1070 == -1070
    w↓H,1← = -833 == -833
    w↓F,2← = -1576 == -1576
    w↓G,2← = -856 == -856
    w↓H,2← = -666 == -666
    w↓F,3← = -1182 == -1182
    w↓G,3← = -642 == -642
    w↓H,3← = -500 == -500
    w↓I,1← = 250 == 250
    w↓J,1← = 250 == 250
    w↓I,3← = 150 == 150
    w↓J,3← = 150 == 150
  }
  Test "typ0,wind0,cpe=1" PASSED.
}
Test: typ1,wind0,cpe=1 {
  Inputs: {
    PrintCaption: False  ->  False
    Caption: uživatelský popis  ->  uživatelský popis
    w↓F←: -1970  ->  -1970
    w↓G←: -1070  ->  -1070
    w↓H←: -833  ->  -833
    w↓I←: 250  ->  250
    w↓J←: 250  ->  250
    w↓I,2←: 200  ->  200
    w↓J,2←: 200  ->  200
    Headline: True  ->  True
    c↓pe←: 1  ->  1
    typ: 1  ->  1
    wind: 0  ->  0
  }
  Results: {
    r↓1← = 1 == 1
    r↓2← = 0.8 == 0.8
    r↓3← = 0.6 == 0.6
    w↓F,1← = -1970 == -1970
    w↓G,1← = -1070 == -1070
    w↓H,1← = -833 == -833
    w↓F,2← = -1576 == -1576
    w↓G,2← = -856 == -856
    w↓H,2← = -666 == -666
    w↓F,3← = -1182 == -1182
    w↓G,3← = -642 == -642
    w↓H,3← = -500 == -500
    w↓I,1← = 250 == 250
    w↓J,1← = 250 == 250
    w↓I,3← = 150 == 150
    w↓J,3← = 150 == 150
  }
  Test "typ1,wind0,cpe=1" PASSED.
}
Test: typ1,wind1,cpe=1 {
  Inputs: {
    PrintCaption: False  ->  False
    Caption: uživatelský popis  ->  uživatelský popis
    w↓F←: -1970  ->  -1970
    w↓G←: -1070  ->  -1070
    w↓H←: -833  ->  -833
    w↓I←: 250  ->  250
    w↓J←: 250  ->  250
    w↓I,2←: 150  ->  150
    w↓J,2←: 150  ->  150
    Headline: True  ->  True
    c↓pe←: 1  ->  1
    typ: 1  ->  1
    wind: 1  ->  1
  }
  Results: {
    r↓1← = 1 == 1
    r↓2← = 0.6 == 0.6
    r↓3← = 0.6 == 0.6
    w↓F,1← = -1970 == -1970
    w↓G,1← = -1070 == -1070
    w↓H,1← = -833 == -833
    w↓F,2← = -1182 == -1182
    w↓G,2← = -642 == -642
    w↓H,2← = -500 == -500
    w↓F,3← = -1182 == -1182
    w↓G,3← = -642 == -642
    w↓H,3← = -500 == -500
    w↓I,1← = 250 == 250
    w↓J,1← = 250 == 250
    w↓I,3← = 150 == 150
    w↓J,3← = 150 == 150
  }
  Test "typ1,wind1,cpe=1" PASSED.
}
Test: typ1,wind0,cpe=3 {
  Inputs: {
    PrintCaption: False  ->  False
    Caption: uživatelský popis  ->  uživatelský popis
    w↓F←: -1970  ->  -1970
    w↓G←: -1070  ->  -1070
    w↓H←: -833  ->  -833
    w↓I←: 250  ->  250
    w↓J←: 250  ->  250
    w↓I,2←: 150  ->  150
    w↓J,2←: 150  ->  150
    Headline: True  ->  True
    c↓pe←: 3  ->  3
    typ: 0  ->  0
    wind: 0  ->  0
  }
  Results: {
    r↓1← = 1 == 1
    r↓2← = 0.8 == 0.8
    r↓3← = 0.6 == 0.6
    w↓F,1← = -1970 == -1970
    w↓G,1← = -1070 == -1070
    w↓H,1← = -833 == -833
    w↓F,2← = -1576 == -1576
    w↓G,2← = -856 == -856
    w↓H,2← = -666 == -666
    w↓F,3← = -1182 == -1182
    w↓G,3← = -642 == -642
    w↓H,3← = -500 == -500
    w↓I,1← = 250 == 250
    w↓J,1← = 250 == 250
    w↓I,3← = 150 == 150
    w↓J,3← = 150 == 150
  }
  Test "typ1,wind0,cpe=3" PASSED.
}