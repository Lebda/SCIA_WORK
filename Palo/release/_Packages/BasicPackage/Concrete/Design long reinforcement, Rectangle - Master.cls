<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="a3a2e315-ce45-4427-9a0b-8a1369011a23">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">void UpdateDialog() { 
    Dialog.GetComponentByName("ECSteel").Visible →INI400_007941= SteelType == 0; 
    Dialog.GetComponentByName("SteelProductLib").Visible →INI400_007942= SteelType == 1; 
    object CombiTable →INI400_008049= Dialog.GetComponentByName("CombiTable"); 
    CombiTable.Columns[1].Visible →INI400_008050= FullTable; 
    CombiTable.Columns[2].Visible →INI400_008051= FullTable; 
    CombiTable.Columns[3].Visible →INI400_008052= FullTable; 
    CombiTable.Columns[5].Visible →INI400_008092= FullTable; 
} 

object Extern →INI400_007972= LoadExternCLC("Design long reinforcement, Rectangle.CLC"); 

IF(PrintUserHeadline) { 
    →INI400_008036TEXT(Headline); 
} 
IF(PrintCaption) { 
    →INI400_000026TEXT("Design of longitudinal reinforcement of rectangular cross section"); 
} 


→INI400_008091BLOCK { 
    IF(PrintSection) { 
        object Shape →INI400_008071= new object[]; →INI400_008072Shape.Add(new PointD(0, 0)); →INI400_008073Shape.Add(new PointD(b, 0)); →INI400_008074Shape.Add(new PointD(b, h)); →INI400_008075Shape.Add(new PointD(0, h)); 
        →INI400_008076IO.Set("CS.Component.Shape.Point", Shape); 
        object Extern_CS_Input →INI400_008021= new Structure(); 
        object Extern_CS →INI400_008023= LoadExternCLC("EC_Concrete_CrossSection.clc"); 
        →INI400_008024Extern_CS.Draw(Extern_CS_Input, null); 
    } 
    
    
    object ResultColumns →INI400_008083= new object[]; →INI400_008084ResultColumns.Add("A↓sy1←"); →INI400_008085ResultColumns.Add("A↓sy2←"); 
    object CE_Input →INI400_008086= new Structure(
    "InternalForces", InternalForces, 
    "Extern", Extern, 
    "h", h, "b", b, 
    "c1", c↓1←, "c2", c↓2←, 
    "ϕ1", Φ↓1←, "ϕ2", Φ↓2←, 
    "DesignMinimumAs", DesignMinimumAs, 
    "fyd", f↓yd←, "Es", E↓s←, "εyd", ε↓yd←, 
    "εc2", ε↓c2←, "εcu3", ε↓cu3←, 
    "ColVisibility", "11000101", 
    "ResultColumns", ResultColumns); 
    object CombiExecutor →INI400_008087= LoadExternCLC("..\CombiExecutor.clc"); 
    IF(PrintLoadTable) { 
        →INI400_008088CombiExecutor.Draw(CE_Input, CE_Output); 
    } ELSE { 
        →INI400_008089CombiExecutor.Calculate(CE_Input, CE_Output); 
    } 
} 

object Extern_ConcreteMat →INI400_008061= LoadExternCLC("EC_Concrete_ConcreteMaterial.CLC"); 
IF(Print_ConcreteMat) { 
    →INI400_008062Extern_ConcreteMat.Draw(null, ConcreteMaterial_Output); 
} ELSE { 
    →INI400_008063Extern_ConcreteMat.Calculate(null, ConcreteMaterial_Output); 
} 
f↓cd← →INI400_008064= ConcreteMaterial_Output.fcd; 
ε↓c2← →INI400_006301= IO.CONCRETE.EC.eps_c2; 
ε↓cu3← →INI400_006302= IO.CONCRETE.EC.eps_cu3; 
→INI400_008081PAGEBREAK(); 

object Extern_ReinfMat →INI400_008065= LoadExternCLC("EC_Concrete_ReinforcementMaterial.CLC"); 
IF(Print_ReinfMat) { 
    →INI400_008066Extern_ReinfMat.Draw(null, ReinfMaterial_Output); 
} ELSE { 
    →INI400_008067Extern_ReinfMat.Calculate(null, ReinfMaterial_Output); 
} 
f↓yd← →INI400_008068= ReinfMaterial_Output.fyd; 
E↓s← →INI400_008069= ReinfMaterial_Output.Es; 
ε↓yd← →INI400_008070= ReinfMaterial_Output.εyd; 

→INI400_008082PAGEBREAK(); 

double Index →INI400_008017= CE_Output.Index; 
IF(Index &gt;= 0) { 
    →INI400_008059BLOCK("Detailed calculation of extreme combination:") { 
        →INI400_008039CE_Input.Set("N", InternalForces[Index].N); 
        →INI400_008040CE_Input.Set("My", InternalForces[Index].My); 
        →INI400_008019Extern.Draw(CE_Input, CE_Output); 
    } 
} ELSE { 
    →INI400_008058BLOCK("No input: ") { 
        →INI400_008054TEXT("No combination of internal forces was set."); 
        →INI400_008055TEXT("Enter some combination(s) to the input table. Output will recalculate automatically."); 
    } 
} 

</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="1000" Material="1" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="1" EWNSource="" Icon="/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCABkAGQDASIAAhEBAxEB/8QAHQAAAgMAAwEBAAAAAAAAAAAAAAoICQsEBgcFA//EADQQAAICAgEEAgECAgkFAQAAAAMEAgUBBgcACBMUCRIVChEWJBchJjEzNlNjcSIlQkSDI//EAB0BAAICAwEBAQAAAAAAAAAAAAAIBgkFBwoDBAH/xAAvEQACAgIBAwMDAwQCAwAAAAABAgMEBQYRAAcSCBMhCRQiFRYxIzJRcRhCJEFS/9oADAMBAAIRAxEAPwB/jo6Ojo6Ojo68b575/wCJe2XjHYOXuadxrNL0nXgzyRx4w/euLPK7LKWua3W/eLd/s1tFQ8KqkroGdbyIxcDgsuycKd3ed+oB7j+Y2LnTO2tYPb9x5kxVB7VWMSt+U79UZEZQcHsTiSYNRCcyrJABo6pW5Gi967VvIkZRjDds3vXtOiU5Wyz3JUL18bUUTXZl5ID+BZI4IiwIE1iSJGKssZd1K9Mp6fvSh3i9SN+VNCwkNbXKNlauY3XYJpMdrGMm4R3rC0kNi1k8gkUkcjY7EVL1qJJYZbaVa8qz9OEcz9yfAfbvTM33N3Luh8apLV8bTwbNsCSt07XzeFWxZqNbGQ2w3cJPmGpiNPVvT82cw+n7wn9azt9+e/46dItW6qv3vfuQ5KGTF7+hcd2rVUyNtAb0mVHtmY1cZwpzJGvcjjEWIPxIMS5gDIzFDC5u7nY7R282G3s766sjZZsbi5fatLSwYliMZMO2DxTttGzGMY5KcxCZxGOMy/bGOubVantV8vNyj1nYLlQZpLEaqqaxsVxsQgMs15nTWMKJoiMEkhSlgkYFHPMcRnHOdD5Hv1sNqUphcJj6kfPKiybOSssq+XJJianGoYFCVET+BBHuMCCLYNP+kz2fwFBLPc/uht2w2yoWV8IuF0rDRTSCApGoyEOyXZzG62I1la/W+5SWNvtYHiId4lb9RB8fR2FwFDzumIxhCI4zxtVzXVGQkYTZYinuTTcggjnJSxVVZYzCMsAXMXMRylPxP8wXx28wTqk6LuO1zWbu2sIVa9DyNU7Hx+6N01gvXqCM/stSlrsoOzcUOBha7YWisYsmTLlQtBI5/dvwrzJr/r/nuJeTaT2/N6n5fQ9prfa9fxef1/dqg+bw+YPm8f28flF9/r5Ifv5yyswmwwm4uZVtUxVmlWREAwswAkhHXYAWMChMEsZDKIkYkGSMoTjiWM4x8kXfHdacqm/i8TLETwY5KV2o5/g/hILZCtx/9RuPy58T8cSG99LP0xbFSkTUd87gUryKXjuU9n1fYayf3oDZpnX0eSL3OORFdqMWj8BKvLc6tFPdU+w1y9xQW1ZeVLnm9S0p31bOua9c5VT+u6kU6x/AyAy5vEWXjOEoZ/Ug5xx9LrMz7Ze+Puf7RbQbnCPKuxa9SzsEbGz0Zt92x0K9NXslbXjbaxNoak4SOcuWppSSYdCUyjZzJsMLlb5+PX5weGu7GwQ4z5uU13gXmhyDMKgbF03nj3djKQYbPCmvbhUK+sWEkYD9Gjv7tti0bA4sg8ZqVeo7t3UO7uu7NJDRthsJlZSqR1rcqvVsyseBHVuhY0Z2JASKwkEjsfCJZWAJrs9RX07O8vY6nkNowDRd0dBoLNZt5rX6UtbO4ahEvm1vPaw01uzFXhRZXs3sTay9GrBEbV+ajGxSO9Po6OjrbHVfvR0dHR0dHR1HLuq7oOMe0HhnYuauVn5q0NRMdbVV4Pt7ux7M6s2xU67XywMsRtPxRaJkkoEyNZZiYAONYXSZkb0hz82vfXd9y/cVZ8TavYWaHEXDZia8lXgesBVO33fkhYG2xuqfRr2wOTiwFXImABHEaKAPWOWqDcWMH7gbfFpuAmvjxfIWGNXFwOpZZLbqW9yQAj+lXQGWTlh5cKg5ZwC0fpE9Ot71J93cZqDmerqWIiXP7zk4JFhlqa9WnijarVkZZPHIZaw8ePpFYpDE0slp1WGtK6Qc75O+Tlrvl5asOQOQLAyWtpGMto2jLGJGm1amiQuFQhVwUgpOyEScjnlMxMEMxKTDLLLzz0QdcrE7vYaGmsLlLXULe6q6x7YLKJZ11Em+8BVm5fgDEjTSrAlm61EMclkABMDxmecY6kl2jdnvL/eZyFa6FxPTON51zWbPbNpvY1b9hW0NUgAklhs5THmM7O5bh6VJU4MN+4PBkVUB5pf1CeKcn8Ybpw7ultoO/VP4jY6j1iGCNld1NtN1cbaFhXvqEKs4k4sWBITHPBQFwZJ0Ktiq2ouleRGbyA/c2VitW4MjdlRshOH9mzYiKtLAJFI8AqkIip4KqqyRfMTBOnHTZO2Gosex2gZDA6/lNN1qjYh1DFvX/UcJiL6yxUMo9OZXFmSWVDasS2PuJpZZobWQBW/BJYeN7Ofhi+PfQNA1jdMVY+6C2vlkNgrOUdysGo1JvrJ+SrOr6rQvqVVGMMW4COtZyubhOzrAEM6tYpeMFxGq6Ho2iLkT0jTNU01QwUljK6rrtPry5V62BRVy5AVCaYphQEcw0hSjkasDFgCI4knjKMHxR/LNs3Zhs0OM+Y7a82jttvprwnX4Fm0d42dHk/lv9bXAsS0ZGyEgF3qnB2FjrV6SayqmcCfr3qNS23Wd81mk3LTbuv2PV9jrwWlJd1Z8MJWCTGP3gUU8ftKE4SxMLC5oDZUZGZVoIWQlFBwe2ma1PNYaNtfxtDEW6qJHkMbDFEtqvJ+SrK8oBntQTEOYrUru7gskpEodeucX1t9tPUF2z7k24e8G6bV3DwOfs2reobrkbt+bB5imDBNLRr49mXGYPJ4wGrHkcFRr16tZkgnoJJQkqzN+1/rGt7WmKu2nXqPZK8LMHQo39ShcJicGIwBtiVsV2QDZGBlgMDxhgsRHMOM8QLPEoa8//HT2pdw1Y8DbOLdZRuT+sVO5r6lWQkT1ybK9aEVMTGK9KsGwx7lgvrsdesbKUnRyuAYt7abk5ujqf3MfRyETw3ada1FIPF0nhSQEcEf9lJB4JAIII5PB6UfXtu2nUr1fJaxsOZwN6pJ7lezisjapPG/krkgQSorBnRGZXVkcopZT4jhI/vp+Cnk/gutt+QuDnIbpo9bOZWKxh0hX4K5hhSsWT+683g3liwmVppW1zjXht3dXR1e1O2eV0nF/P+401j/7tVbVTv8Avo2NbYon/wDkym6myL/bOucf/gSH9WrU6knZJt11ios/XvrHSeRdAJpN1NoUwNKNqngQDKzICTCcBoTEYU5jJCUJZxlVn5mPi2cfUrObOFFUjnSM7W5oyZFG9txnWlYrakZ45cM2x6lass2dKsD5OwZMljr18zh4FJZ3C6dxu0VepXmzmqxSRiEe7axUY8wR5rzJT/JWj8FJb2VDliAIwGPzcz6MPqJ5bPZjGdrO/mQqW/1NxRwe/XWFd0b2JvClsh9qWO4bUwihGSmev7IkeS5JJGpKd8+FD5Y7XlRnWOz3uIvDWvIGQ2CnE/INqZBc2xJVyjtqHTLckYIgK7XVas0NdzGBbNqCqiGM2eWMfiGc+spKkubTXLmo2GjdNW3VDZoXNPYrZxFivtKtoT1e6vKUZRwZVsATizKMsYIOOcxzj+rrRj+MfvTB3y9q+qcoW5qkPJ9AyzpfLtNVDAkujuVTEZI2ilVCxsWUKnZ6k6F3X4YkGHmYfTWHgaEsRkPZvfps5XfWsvO02Tx8AloWpW8pLlCPwjeKVmPlJZqEqfcYs80D+TflA7vp76kvpIxnazMVe9fbrGQ4/R9uyjUNrwVGARU9a2u4Z7Ve9QghUQ1MJn0SdBUjjirYzKV/ZhPs5SpWrWFdHR0db26ql6hF8inOQO3ztG5a32c2Rskom6NCQK4FmIp3kHm2691Y5wSitdVFdZUcGFyDOs5ZKGi1WDgS3r82mysHLexftbA3sP2brVg8x4xC87jpyMsm8QICCLymLOfjCMYofb6jhCGMRw6z+or2pxLtX1bVa+88QLfZlWdj18TYp+wmK81w+v2D9dmU5i+r9ZaDqbLIhFz4LpJRjIS2gCJmccap/HfIeh6P5vW/jLc9X1T2PJ4fB/EV4jUeby+s54vF7n38nqNfT6/b1j/t4pKX3yv2L214/DpyYqdGExL5cK9i/K3kSOfHkCONPI/kPyX4AHPQl9K3UsTq3YDcu49kIt3Y9qya35vZBmr4fU8fC0KLIVEhWV7lywYUPtMFgkBZ2IR8z4R+1Wu7buyXTNndRZByF3BDT5X3Q1hXWNU+tXPrTFo2vTTsS+TC1RrhI2AmIKpwbcvrBgcTrEWYJ+vyWfGhofdhpVvstBQBDvqAbe0XlWpELaKXbycxH2zWlE2q8tjZFLBZva9Km2Kt3+KKrwoB3RBFq1tqpaeu16nqaCnX9Opo6xCnq1PMdj1a6sVEkiv52inZP4FgCF5mDGOT6/cxSElKefpdMdFqmI/bNXV7FWGbH16MNQoUHBeNB52F8uSJZJvOdn/uMjlieST1S7d7/wDcM97s931xGdyGM3DMbRkNhWzHYYNHWtWH+2w8ntlUfH08aIMVFWC+ylKCOBUEahest/mvg3kHgHcS6ZyDXBA3IOG6u4rSMNa/sCGc4jl+ksGFUyshGXOQsBYVVdUNjxtqAlIf3tW+KP5Ztm7MNmhxnzHbXm0dtt9NeE6/As2jvGzo8n8t/ra4FiWjI2QkAu9U4OwsdavSTWVUzgT9ezD8jvxxaN3S6NfXFPQ/2l/mbh5GnWH+YxceOWZ7hp8MR/zL/fLYNfjj1d2V8pBi/iX7R2BE7nTgvee3/eXNK3VP/Uaob5UZPw+zU/kzANpVmnj/AIG6kTPtVzX2XYj/AIZCq3sWu7D2qz8OZw08poiQmtZIZ4mjc8NTvxqVWWGQELwxH5ePysyxSvfD2c7y9nvX52kyXbXuZi6CbSaajMYVWhr5CG3XXzh2XUrc0c0lDJVGUykwK/8AS97mOfGzX6NfT41LbdZ3zWaTctNu6/Y9X2OvBaUl3VnwwlYJMY/eBRTx+0oThLEwsLmgNlRkZlWghZCUUOxdIOfFH8rmzdjGzQ4z5Lnebf20bfeLmt6gLGXXeLHXcnhZblptbMBDsjZORNnY9cWcWWsFlnHkUzbAaE2Hu9J3bUeSdR13fdC2Kp23TNtqU73W9konBP1NxUviwZV1NoOcwmOcM/WcJfUoCxIA4xHEQcWT0fecZuuNFisVrZKuqjJYxn8pazkkCSMkKZqspHMUyr8c+3KElVl6pQ9UvpY3j0xbo2HzSTZnTMvNNJpe8Q1vZo52rGqSSU7cSSTrjM9QVxHkMZNL5N4i7SaxQminPaOutbjqdPvWrX2oX4fPU7DWM1rf1GqQ6/nh/wDg+l7qziwbOsZiGxq2irH9KxVVbgPJAQ67L0dTVlV1ZHAZXUqykchlYEEEf+wQSCP8dLFDNLWmisQSNFPBLHNDKh8XilicPHIjD5DI6hlI/ggHrN6+STt1J26dz27Ui34/8Ls1rd3Sg6wkpoo3al29U7fXKQKJQ8a+OwqNWlRjKCa4aa2rkAjwZBoYbKf05PP9to/dNvvb+XHsazzpoxLuECHLj8dt3FYLS4rm1QxSaj/Pa7cbMq/jLVYI/grSHO2dCvUl7T+pG4/TQ23ije1QMnPYlFGxdO2LxIOX1O9UQr0kx+Ccln6/i1FyZTieKu4o3+zqwHgpypS+NTZltQ7+e0u+duK+gRX5t0xN+1tGUk69avuX8Ur0WWrHMVF4NKWBlImJOExzPCS5BsYFOKb2Iv2Z3driofbgTO1CoDBB9nlSkNtD5AoiGOzYUKOVRPFQyleV6TcLf/5LfTszDbGpt5Wx2rzyyySRNZk/cOhJPk9ftKIZUsWLKWsJiJpJW9uW1YEsjwzRzeM2lB0dHR05XXNb0tD+oqp7EHE9DflX+tTZi02nSb8wJeexo9q2B20X8ES5ZH6q2w05fMYIwH9z6LlMRdqAFNuA7BOo514WtbA3roVnLPHNg8x4yl8CaW4UzLJvECBTF8QRTn4wjIWf1+o4TnnEcu9/OlxTYckdoVg6mlCylrQ7w6iS2ITu83Ifwu5InqRGUOKcMVuh3aVjABg2jS78aysEwawJkCGKzLCbC7ibBlW1TCZVaWKQDCzACRKBhc4pQKEwSxiQRRyiQZIxnCWJYxnCf954no71XulCYnqUp4yf+7QTPJKgPAHwzqP55AYc/wCT0Z/TQv1dq9KuZ1lbEceQg2LZsXcWM/NaDJ4unRx87qWdwZIa0jklfF3jcoOOUTV66Oox9mnP9Z3PdsfDXNKL3u2G36NQm2yBFk69pLdVa5dba1WqtFlsFX97kbLyCuC/UlO5Wugj6ra8pSc6bmrZhu1q9yu4eC1BFYhcccNFMiyRt8Ej5Vgfgn/fXPDncLkdbzeX17L12qZXB5O9iMlWcMGgvY6zLUtREOqt+E8LqCVUkAHgc9HVS3yO/HFo3dLo19cU9D/aX+ZuHkadYf5jFx45ZnuGnwxH/Mv98tg1+OPV3ZXykGL+JftHYLaejr5criqOZoz4/IQJPWnRkdHUNx5AjyXkHgjn/RHweQes5oe+bP222fF7dqOUs4rM4mzFZr2K8rxeZikWQRye2ylkYqD/ACGVgHQhgD1lv838JbrwLvlro25omxJU0pU1+JJwFJtNXIYDgtaNtoIxOBwJkIXxrkPmrsos1bc8Nqljizf4pPlb27sY25fjbkli223td222wW+oRZK/bcYWz5YxY3fSF5SzOak55wfatVBmIrkUZ2VbAV8KUbRoD5Hfji0bul0a+uKeh/tL/M3DyNOsP8xi48csz3DT4Yj/AJl/vlsGvxx6u7K+UgxfxL9o7AidzpwXvPb/ALy5pW6p/wCo1Q3yoyfh9mp/JmAbSrNPH/A3UiZ9qua+y7Ef8MhVD2TWtg7W5+HM4aeUUxMzVLaqzRiJ2/KjdQkiWCReI2Dn8zxyVlEUjdE/ZTvb2h9efaPJds+5WLpPskmPijz+AmkihuPdrQf0tp1eysaNQylOb3LcRqoTXUyFUnx736kGnlpO7ajyTqOu77oWxVO26ZttSne63slE4J+puKl8WDKuptBzmExzhn6zhL6lAWJAHGI4iDj2jpBb4pPlb27sY25fjbkli223td222wW+oRZK/bcYWz5YxY3fSF5SzOak55wfatVBmIrkUZ2VbAV8KUbR8HSd21HknUdd33Qtiqdt0zbalO91vZKJwT9TcVL4sGVdTaDnMJjnDP1nCX1KAsSAOMRxEHFldG3nG7tjRYrla2SrKi5LGs/MleQ/AliJ4MtSUgmKUDkHmKULIpBpM9VHpX3X0w7q2Iy6zZnSszNYl0rdYq5jqZinGfNqF9U8o8fsOPjZFyGPZ/F18btJpqUyOqvv6ky4XVqOKKbJA+9bs6myIBUhsEkhVf0uZdYWaKuWKBgtvVYpFXOq6ddphUciolsRZXH7KNIY5I7wO2HSFXw1Zdi544sTlYsBIzBJeG5VDTjMVhyHJowlFzyWVyZYbLGBAK2oIk2RWt/qDee/6Q+66v4prLb8lR8WUohHh+I9H07hkcVG6j3WALNv/ibdfZGPPAU1S/m/2FZWSoUAVMcPhI4XuOXfkM4bsVE2SUfEkrnlbZbGNJ+Yrq4Gu1jK9HCwJNlUFWSx2awqEqyxlI51bGYGFkzzBKQlx20psHd2OnWVrEZzeLx7hSOGWCaH7sqyuQEjHvEuCpARm4BHJuj9PQsdovp3W9kzUsOJsjtjvW3V3njZjFNk8dkF15J4JKys1m4642OOBknEjWIY/NlbwTQW6Ojo6cbrm368v5q44X5c4r3bjpmQcR2ammsvFvI8IFsE2AWdWva4IjZYnTM2SSi9yKCLBzVRHBLxieYyQzS+5zhO47e+bd64uuE2UfwdswSsA6D1HIVDJiySE2gSws3UGU/oVA6lozi0GVScnQhLPMMagnS4fze/Hj/S5q+eeuOae2a22iHZuM19HWU+FZWLuKgR6976HrjzW3A60nlnmYmnX7hGwlJ153d1amWnu8Wny7FhI8lRiMuSw/nIqKOXmpv8zxKP55BAkUKCWdVB8U8mFjv04PUbS7N90bembTfWlpXcj7anPZmYJWxuw1+UxWRmY8KI2V3pTPJIiRV55pFEs4hhkgr8BvyKV/E2zOdnHMew19Pxzu1hY7DxDfPpzgOg5CeyqS51i1u4HivXa7siKh7NFixVwohsC7EC2Kw7nEYuTdZRn/caax/92qtqp3/fRsa2xRP/APJlN1NkX+2dc4//AAJD+pvn4tfnK1/cavTO3rvQ2INLvoTKatqPPFwwaNXumD5WU15Lkc8U5qU2wQlgyNlvlk+nV2spVTd5ANgW8vjQ7tF3JrQVodT2G0tZoCIsNesMViMZbgY2xK7cRPEx4ps/jEYv/GLI0cKysj9RL0T5zKZvI+oHs9hJczDlY2v9ydWw8AmvxXI4vOXdMPRrRed+tehT3djgg966l3nNJHZgt5GSgz10dcZJ1OyTUsa5tZ+vfWA6i8kcTSbqbQoHVbUaBMgGVmQEgYBwzmIwpwIOcoSxnPJ6ZIEEcg8g/II/gj/PVKTKysVYFWUlWVgQysDwQQfkEH4IPyD8Ho6qW+R344tG7pdGvrinof7S/wAzcPI06w/zGLjxyzPcNPhiP+Zf75bBr8ceruyvlIMX8S/aOwW09HWOyuKo5mjPj8hAk9adGR0dQ3HkCPJeQeCOf9EfB5B6mGh75s/bbZ8Xt2o5SziszibMVmvYryvF5mKRZBHJ7bKWRioP8hlYB0IYA9ZcvOnBe89v+8uaVuqf+o1Q3yoyfh9mp/JmAbSrNPH/AAN1ImfarmvsuxH/AAyFnl8fHyvc39idPtfHaXk3jiLaFnmq7VrI0Ttce7c1+0pbXo+XczSXk9+0429A8MtE89Ja7MmVtV1W4Yr+a3hvtDW4iud35W3PUNH22znl2o1TLeI7nsO1P+ytX7XodLVpWt2OwM8CYtyLmpnq9tWjdtbhlK3UaLeI+dJntGKv9stqVsJlljlKSS1mgmVrMNaU+LV7sPLH2pAeIxMOZAhYcvEsrdK/YnfdS9cnYOev3R7fyW6SWamPzaZTGz18NkszRX3osxrWR8IVW/TkXyttjJPCobKROVq5CTHx9z5E3i45K3nat8vp+S22q6ct2/8ApVj4/YJnwL/ySiC0/VWiFbyjTX8/i80xRISfTj/6eTtHPxVwbuHctttJ6m2c5/jqzT2242IHlONagxXY4WAYUKxms2eznX3I7VFhubOUQVrA0GKg8GlyfjU+Pveu/jm4GtKrO03D+l+vcctb/ILQ0KmuJLOK/W6xoYJBd2zYzRlivpsNJHlVKXFnl1MVfk+NEvXNeptS16i1TXK8NTr2s01Xr1DVLZJlespqVEFbV16+SzIXIU0VgLCyQhCZGOP3nKX7yzP+yepWbuRsbplI3MUTTx4x5l/K3dseaXLq+QHKwqzwrIOVeaaUKQ8DcKP9T71BYPWtMw/pk0W1WS3dixVzeKuNmAi1/WsOKs+s6vMImYRzZKaCtkpqblJq+Nx2PeVWr5WPy+z0dHR0z3VF/R1xnUk7JNuusVFn699Y6TyLoBNJuptCmBpRtU8CAZWZASYTgNCYjCnMZIShLOM8no6CAQQRyD8EH+CP8Hr9VmVgykqykMrKSGVgeQQR8gg/II+QfkdKq/Kv8Mrmy3rvN3bagBc7/uO7PTni+RQYk02HmJ3TCSlgyvlZZUn47b3A5TOsPFZur6jyyOyXipOz6psul3LmvbZR2evXSBmF2q61UMmxAirTCJ5QiWOInDFtVkEWQSKuUgCYEWeI5z1qwdVzd1nxd9qnddVkhsuj1mq7IMOA12ya3XjUnXY+yMI+qmiesOgEIVTFHX0FnR1dhaNkstlR2HMcrE0RvfZuvmp58rrskNHITFpJ6UvKU7Mp45ZGUN7EjnlmIXwJJJBJ56tb9KX1J8z2wxmK0HvJTyO16fj44aWM2Sj42djwlKMyBYbEU0kX6tUroY44Y2lFmONEiikWNApSI7Xfkr7ye0FOdJw7y7Zw06f7ZxoO5Kr7ppS0vLXSISrpb3DGKExl60KJTUDFWXKZTwjOBZwMO7Hjj9TXtC8GQ8u9qtBbFyGMk7DjjkWx12EWIsG+4mafZ6DaJECVQgMRYFeDIBhQ0srMisYRq/Fuev07fcFrjthZ8K7RrO1U8U3reVVYvHyOsHF9ksKdOwgrDaLpxWohjAllNKdYeYGmJZt1uzYWqa49m+JP5DNbhM8O2PkTYlBhCUrGs1ZLEkCGYyvhaFYfCd0yYecjMaSdYwuJcuDSYxELXr6wrt3h0zipVjzv2sQ4jhWqMzSEalgPYSSG2IY/yJIjWEj4LAEDh6sxF9OD1MFtizlrtYM7kCXuZCfOSdtNmNyX2WYZWxUyOvNkrv8ATREkuS5JX5kSvJIJZPO9Fn9TlosF2JJ9oW2nbiEslQM8w06q5mMQlkAmGhcfOFWCQuIwKwNNogYZkSCx5RwKUDebf1EfeLyRRP0XGur8e8Ge+s0jK910DW17IBV5MQDmVf2iB007ZU8CmqbNGsU9ATR4GWddEhYpV1UXxm9/my/jp0vaZzO2tbLQdrrImqHSp20zK5dA2K6eItU5WaW+pVDydiJvyBgtMpDhhOY/DHwG9/3KX4t3a9Y0zhSjsPd8znI+1qkuEPU/KiH7OsaoPYbeHtN16wg+aC/2VtUbAflVwzkHu2y96c/xThjzyCRSpNTCpjAQ5QFmurTrmLjyX8/uIwqsW5CknrFQ9k/pk9pS2xZK92mtSU5VmSPP9zLO7uJK6TSCKHV32PLpkC3syn7c4a480qLEEd/bj6qI5D5I33lnbLPe+S9tvN33C6nAlrsexPmsbR4kMft92GTZzKc5yzMxZf1SMyU7RszYOYpLCOwH4ruf++baat0NZbcY8ICZwTY+YNh12zzXHQECDB1NGWZGgltt4X2EACXFaLJrQfjYHYIuk2LDJPa5+ny7U+IC0ex86Wtt3D7Ygsuw1UWgja1x1i4MnML4568g+V69qU2JCLTBtXxfYo2GLdZ8LStfVX4JJJ1qaldXKLIV6CwEkUUgCVTSTVFACqiioIDAsssAcAgAGEBBFCAxwjCOMYk2qdkb1m0Mnutn8TKszYyCw1izbdiXk/ULytxGGbgOK0k0svLH34SAW0f3/wDqh6vhcG+j+mHBkSRUpcZBu+Uw8OIwmArxIteodQ1aaLyttDCGNeTNUsdRpGOFRichG7CHxft07dOJe1XiXWeF+F9ZDrWma0HMs5lkbFzsVywMUbXatqtYiCW62a6KEZbGxKMY4DGtXVyyFPX1tan7j0dHTKQQQVYIq1aKOCvBGkMEEKLHFFFGoVI40UBURFAVVUAAAADqk7LZbJ57J5DNZrIXMtl8tcsZDJ5PI2Jbd7IXrcrT2rly1OzzWLFiZ3lmmldnd2LMST0dHR0devWP6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6//Z">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Steel_check_N_My_Mz.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Design of long. reinf. for rectangle, N+My</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="Block headline" X="95" Y="268" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Standard 10px" X="10" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" />
      <Style Key="Standard 200px" X="200" Y="334" Hor="0" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" />
      <Style Key="Calculation headline" X="0" Y="7.43" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|16.3|5|2" Font2="Tahoma|16.3|5|2" />
      <Style Key="Calculation headline 2" X="0" Y="268" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="ExternCLC" X="0" Y="268" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
    </Styles>
    <NormRef>
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Modifier="Public" Name="A↓cc←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A↓cc←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="A↓sy1←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_A↓sy1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="A↓sy1req←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A↓sy1req←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="A↓sy2←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_A↓sy2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="A↓sy2req←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A↓sy2req←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="A↓syreq←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A↓syreq←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Value="300e-3" Precision="2">
        <Description TranslateID="VARIABLE_b">
          <ENU>Cross section width</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="c↓1←" ESA_ID="" Type="Double" Value="30e-3" Precision="2">
        <Description TranslateID="VARIABLE_c↓1←">
          <ENU>Cover at the bottom edge</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="c↓2←" ESA_ID="" Type="Double" Value="30e-3" Precision="2">
        <Description TranslateID="VARIABLE_c↓2←">
          <ENU>Cover at the upper edge</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="C↓mLT←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_C↓mLT←">
          <ENU>Interaction factor according to EC3, annex B</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="-" />
      </Variable>
      <Variable Modifier="Public" Name="C↓my←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_C↓my←">
          <ENU>Interaction factor according to EC3, annex B</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="-" />
      </Variable>
      <Variable Modifier="Public" Name="C↓mz←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_C↓mz←">
          <ENU>Interaction factor according to EC3, annex B</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="-" />
      </Variable>
      <Variable Modifier="Public" Name="CE_Input" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_CE_Input">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CE_Output" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_CE_Output">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause2_4_2_4_1" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Clause2_4_2_4_1">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause3_1_6_1P" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Clause3_1_6_1P">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause3_2_2" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Clause3_2_2">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CombiExecutor" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_CombiExecutor">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="compression" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_compression">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ConcreteMaterial_Output" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_ConcreteMaterial_Output">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CSS" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_CSS">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="d" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_d">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="D" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_D">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="d↓1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_d↓1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="d↓2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_d↓2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="DesignMinimumAs" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_DesignMinimumAs">
          <ENU>Design minimal reinforcement</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="E" ESA_ID="" Type="Double" Value="210e9" Precision="2">
        <Description TranslateID="VARIABLE_E">
          <ENU>Young's modulus of elasticity</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e9" Dim="GPa" />
      </Variable>
      <Variable Modifier="Public" Name="e↓0←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_e↓0←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="E↓s←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_E↓s←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Extern" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Extern">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Extern_ConcreteMat" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Extern_ConcreteMat">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Extern_CS" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Extern_CS">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Extern_CS_Input" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Extern_CS_Input">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Extern_Input" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Extern_Input">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Extern_Material" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Extern_Material">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Extern_Material_Input" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Extern_Material_Input">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Extern_Output" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Extern_Output">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Extern_ReinfMat" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Extern_ReinfMat">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="f↓cd←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_f↓cd←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ctm←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_f↓ctm←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="f↓y←" ESA_ID="" Type="Double" Value="235e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓y←">
          <ENU>Material yield strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓yd←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_f↓yd←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="f↓yk,max←" ESA_ID="" Type="Double" Value="600e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓yk,max←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="f↓yk←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_f↓yk←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="FullTable" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_FullTable">
          <ENU>Show complete table of internal forces</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Value="300e-3" Precision="2">
        <Description TranslateID="VARIABLE_h">
          <ENU>Cross section height</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="Headline" ESA_ID="" Type="String" Value="User headline">
        <Description TranslateID="VARIABLE_Headline">
          <ENU>Userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="i" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_i">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Index" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_Index">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="InternalForces" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_InternalForces">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="L↓y←" ESA_ID="" Type="Double" Value="5" Precision="2">
        <Description TranslateID="VARIABLE_L↓y←">
          <ENU>Buckling length (y)</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓z←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_L↓z←">
          <ENU>Buckling length (z)</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="load" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_load">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="M↓Edmin←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_M↓Edmin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓Edy←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_M↓Edy←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓Edy1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_M↓Edy1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓Edy2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_M↓Edy2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="mat" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_mat">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="mat_char" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_mat_char">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="max_reinf" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_max_reinf">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="min_reinf" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_min_reinf">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="minimum" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_minimum">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="n↓1←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_n↓1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="n↓2←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_n↓2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="N↓c,bal←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_N↓c,bal←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="N↓Ed←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_N↓Ed←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Print_ConcreteMat" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_Print_ConcreteMat">
          <ENU>Print concrete material parameters</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Print_ReinfMat" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_Print_ReinfMat">
          <ENU>Print reinforcement material parameters</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_PrintCaption">
          <ENU>Print check headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintLoadTable" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_PrintLoadTable">
          <ENU>Print table of combinations</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintSection" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_PrintSection">
          <ENU>Print cross section schema</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintUserHeadline" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_PrintUserHeadline">
          <ENU>Print userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ReinfMaterial_Output" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_ReinfMaterial_Output">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ResultColumns" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_ResultColumns">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SectionClass" ESA_ID="" Type="Double" Value="1" Precision="0">
        <Description TranslateID="VARIABLE_SectionClass">
          <ENU>Cross section class</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Shape" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Shape">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SteelType" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_SteelType">
          <ENU>Type of steel material library</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="symetric" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_symetric">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="tension" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_tension">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="TorsionSensitive" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_TorsionSensitive">
          <ENU>Torsion sensitive cross section</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="UserCombi" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_UserCombi">
          <ENU>Index of combination for detailed output</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="x" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_x">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="x↓bal1←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_x↓bal1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="x↓bal2←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_x↓bal2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="x↓c←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_x↓c←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="x1" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_x1">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="xNotReal" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_xNotReal">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="z↓1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_z↓1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="z↓2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_z↓2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="z↓s←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_z↓s←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓cc←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_α↓cc←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓y←" ESA_ID="" Type="Double" Value="340e-3" Precision="2">
        <Description TranslateID="VARIABLE_α↓y←">
          <ENU>Reduction factor - y axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓z←" ESA_ID="" Type="Double" Value="490e-3" Precision="2">
        <Description TranslateID="VARIABLE_α↓z←">
          <ENU>Reduction factor - z axis</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓c←" ESA_ID="" Type="Double" Value="1.5" Precision="2">
        <Description TranslateID="VARIABLE_γ↓c←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓S←" ESA_ID="" Type="Double" Value="1.15" Precision="2">
        <Description TranslateID="VARIABLE_γ↓S←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓c2←" ESA_ID="" Type="Double" Value="2e-3" Precision="2">
        <Description TranslateID="VARIABLE_ε↓c2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓cu3←" ESA_ID="" Type="Double" Value="3.5e-3" Precision="2">
        <Description TranslateID="VARIABLE_ε↓cu3←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓yd←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_ε↓yd←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="η" ESA_ID="" Type="Double" Value="850e-3" Precision="2">
        <Description TranslateID="VARIABLE_η">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ" ESA_ID="" Type="Double" Value="725e-3" Precision="2">
        <Description TranslateID="VARIABLE_λ">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ξ↓bal1←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_ξ↓bal1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ξ↓bal2←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_ξ↓bal2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="π" ESA_ID="" Type="Double" Value="3.141593" Precision="2">
        <Description TranslateID="VARIABLE_π">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="σ↓s←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_σ↓s←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Φ↓1←" ESA_ID="" Type="Double" Value="20e-3" Precision="2">
        <Description TranslateID="VARIABLE_Φ↓1←">
          <ENU>Diameter of bottom reinforcement</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="Φ↓2←" ESA_ID="" Type="Double" Value="20e-3" Precision="2">
        <Description TranslateID="VARIABLE_Φ↓2←">
          <ENU>Diameter of upper reinforcement</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
    </Variables>
    <DrawingGroups />
    <ResultTables />
    <ResultGroups />
    <Layouts>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_0">
          <ENU>Full</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_1">
          <ENU>Standard</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_2">
          <ENU>Brief</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_3">
          <ENU>Page</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_4">
          <ENU>Layout 5</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_5">
          <ENU>Layout 6</ENU>
        </Names>
      </Layout>
    </Layouts>
    <VisualComponents>
      <VC ID="INI400_000026">
        <Set Vis="1" Prev="" Style="1" StyleName="Calculation headline 2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="Calculation headline 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Calculation headline 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Calculation headline 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Calculation headline 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Calculation headline 2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000046">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="263" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="263" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="263" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="263" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="263" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="263" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000049">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1445" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1445" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1445" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1445" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1445" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1445" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000052">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1445" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1445" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1445" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1445" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1445" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1445" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000056">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000062">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1201" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1201" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1201" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1201" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1201" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1201" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000063">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="296" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="296" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="296" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="296" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="296" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="296" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000105">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1127" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1127" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1127" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1127" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1127" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1127" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000123">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="620" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="620" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="620" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="620" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="620" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="620" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000134">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000144">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="296" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="296" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="296" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="296" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="296" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="296" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000145">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000150">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000154">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000155">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000156">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_000157">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1107" Hor="0" Ver="4" SpX="200" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1107" Hor="0" Ver="4" SpX="200" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1107" Hor="0" Ver="4" SpX="200" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1107" Hor="0" Ver="4" SpX="200" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1107" Hor="0" Ver="4" SpX="200" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1107" Hor="0" Ver="4" SpX="200" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000158">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="86.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="86.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="86.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="86.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="86.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="86.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000159">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000160">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="321" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="321" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="321" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="321" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="321" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="321" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000161">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1071" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1071" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1071" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1071" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1071" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1071" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000193">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1096" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1096" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1096" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1096" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1096" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1096" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000337">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1420" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1420" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1420" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1420" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1420" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1420" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000341">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1395" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1395" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1395" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1395" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1395" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1395" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000348">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1351" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1351" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1351" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1351" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1351" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1351" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000363">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="408" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="408" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="408" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="408" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="408" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="408" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000364">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="394" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="394" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="394" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="394" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="394" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="394" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000378">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000379">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="867" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="867" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="867" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="867" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="867" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="867" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000380">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="882" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="882" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="882" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="882" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="882" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="882" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000381">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="917" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="917" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="917" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="917" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="917" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="917" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000382">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="902" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="902" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="902" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="902" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="902" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="902" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000383">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="210" Y="960" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="210" Y="960" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="210" Y="960" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="210" Y="960" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="210" Y="960" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="210" Y="960" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000384">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1446" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1446" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1446" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1446" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1446" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1446" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000385">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000386">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1533" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1533" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1533" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1533" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1533" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1533" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000387">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1533" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1533" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1533" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1533" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1533" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1533" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000388">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1383" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1383" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1383" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1383" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1383" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1383" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000389">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1319" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1319" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1319" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1319" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1319" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1319" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000392">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1276" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1276" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1276" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1276" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1276" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1276" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000393">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1233" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1233" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1233" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1233" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1233" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1233" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000394">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1446" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1446" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1446" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1446" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1446" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1446" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000395">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1430" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1430" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1430" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1430" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1430" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1430" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000398">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1295" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1295" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1295" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1295" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1295" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1295" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000399">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1383" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1383" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1383" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1383" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1383" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1383" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000400">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1359" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1359" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1359" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1359" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1359" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1359" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000401">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1319" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1319" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1319" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1319" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1319" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1319" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000402">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1127" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1127" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1127" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1127" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1127" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1127" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000404">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1517" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1517" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1517" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1517" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1517" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1517" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000405">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000406">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1498" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1498" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1498" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1498" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1498" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1498" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000407">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000408">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000411">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1723" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1723" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1723" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1723" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1723" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1723" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000412">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1621" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1621" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1621" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1621" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1621" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1621" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000413">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1563" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1563" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1563" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1563" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1563" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1563" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000414">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1545" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1545" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1545" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1545" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1545" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1545" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000415">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1477" Hor="1" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1477" Hor="1" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1477" Hor="1" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1477" Hor="1" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1477" Hor="1" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1477" Hor="1" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000416">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000417">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000418">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1697" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1697" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1697" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1697" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1697" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1697" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000419">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1683" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1683" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1683" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1683" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1683" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1683" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000420">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1595" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1595" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1595" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1595" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1595" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1595" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000421">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1581" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1581" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1581" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1581" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1581" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1581" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000422">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1494" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1494" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1494" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1494" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1494" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1494" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000423">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1459" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1459" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1459" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1459" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1459" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1459" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000424">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="898" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="898" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="898" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="898" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="898" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="898" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000427">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="933" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="933" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="933" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="933" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="933" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="933" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000428">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="898" Hor="1" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="898" Hor="1" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="898" Hor="1" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="898" Hor="1" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="898" Hor="1" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="898" Hor="1" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000430">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="960" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="960" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="960" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="960" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="960" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="960" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000434">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1076" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1076" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1076" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1076" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1076" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1076" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000435">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="780" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="780" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="780" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="780" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="780" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="780" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000436">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000437">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000438">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="764" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000439">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000440">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1391" Hor="0" Ver="4" SpX="50" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1391" Hor="0" Ver="4" SpX="50" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1391" Hor="0" Ver="4" SpX="50" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1391" Hor="0" Ver="4" SpX="50" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1391" Hor="0" Ver="4" SpX="50" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1391" Hor="0" Ver="4" SpX="50" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000441">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1205" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1205" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1205" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1205" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1205" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1205" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000442">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1289" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1289" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1289" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1289" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1289" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1289" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000443">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1251" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1251" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1251" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1251" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1251" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1251" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000444">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000445">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000447">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1096" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1096" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1096" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1096" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1096" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1096" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000450">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1273" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1273" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1273" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1273" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1273" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1273" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000452">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="362" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="362" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="362" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="362" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="362" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="362" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000454">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="335" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="335" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="335" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="335" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="335" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="335" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000455">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="987" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="987" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="987" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="987" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="987" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="987" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000456">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1023" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1023" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1023" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1023" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1023" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1023" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000457">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1006" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1006" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1006" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1006" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1006" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1006" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000458">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1818" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1818" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1818" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1818" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1818" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1818" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000459">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1799" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1799" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1799" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1799" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1799" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1799" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000460">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1785" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1785" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1785" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1785" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1785" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1785" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000461">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="908" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="908" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="908" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="908" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="908" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="908" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000462">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1079" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1079" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1079" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1079" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1079" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1079" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000463">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000464">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000465">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000466">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000467">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000468">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000470">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="867" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="867" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="867" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="867" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="867" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="867" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000471">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1153" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1153" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1153" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1153" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1153" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1153" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000472">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1165" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1165" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1165" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1165" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1165" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1165" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000473">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1541" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1541" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1541" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1541" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1541" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1541" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000474">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1665" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1665" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1665" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1665" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1665" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1665" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000475">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1655" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1655" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1655" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1655" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1655" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1655" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000476">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1624" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1624" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1624" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1624" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1624" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1624" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000477">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1569" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1569" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1569" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1569" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1569" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1569" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000479">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="335" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="335" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="335" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="335" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="335" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="335" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000482">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="362" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="362" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="362" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="362" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="362" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="362" Hor="0" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000484">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="984" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="984" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="984" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="984" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="984" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="984" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000485">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="968" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="968" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="968" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="968" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="968" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="968" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000486">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="947" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="947" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="947" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="947" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="947" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="947" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000487">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000488">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1378" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1378" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1378" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1378" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1378" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1378" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000489">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1519" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1519" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1519" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1519" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1519" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1519" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000490">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1556" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1556" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1556" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1556" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1556" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1556" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000491">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1537" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1537" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1537" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1537" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1537" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1537" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000492">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1522" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1522" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1522" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1522" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1522" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1522" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000493">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1697" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1697" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1697" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1697" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1697" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1697" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000494">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000495">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1672" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1672" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1672" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1672" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1672" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1672" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000496">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1543" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1543" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1543" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1543" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1543" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1543" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000497">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000500">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1727" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1727" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1727" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1727" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1727" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1727" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000503">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1685" Hor="0" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1685" Hor="0" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1685" Hor="0" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1685" Hor="0" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1685" Hor="0" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1685" Hor="0" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000504">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000505">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1817" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1817" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1817" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1817" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1817" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1817" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000506">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000507">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000510">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1787" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1787" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1787" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1787" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1787" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1787" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000513">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1572" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1572" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1572" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1572" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1572" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1572" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000514">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1100" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1100" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1100" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1100" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1100" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1100" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000515">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1100" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1100" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1100" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1100" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1100" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1100" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000516">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1113" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1113" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1113" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1113" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1113" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1113" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000517">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1066" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1066" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1066" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1066" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1066" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1066" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000518">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000519">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1340" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1340" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1340" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1340" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1340" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1340" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000521">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000522">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000523">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000530">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="852" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="852" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="852" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="852" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="852" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="852" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000531">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1457" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1457" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1457" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1457" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1457" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1457" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000536">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1628" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1628" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1628" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1628" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1628" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1628" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000537">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="1597" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="1597" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="1597" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="1597" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="1597" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="1597" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000538">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1687" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1687" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1687" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1687" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1687" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1687" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
      </VC>
      <VC ID="INI400_000539">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1708" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1708" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1708" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1708" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1708" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1708" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
      </VC>
      <VC ID="INI400_000540">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1648" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1648" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1648" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1648" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1648" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1648" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000541">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000543">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1596" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1596" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1596" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1596" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1596" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1596" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000545">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="87.2" Y="408" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="87.2" Y="408" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="87.2" Y="408" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="87.2" Y="408" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="87.2" Y="408" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="87.2" Y="408" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000566">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1555" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1555" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1555" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1555" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1555" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1555" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000567">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1638" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1638" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1638" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1638" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1638" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1638" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000573">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1815" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1815" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1815" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1815" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1815" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1815" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_000574">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1463" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1463" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1463" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1463" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1463" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1463" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_000575">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1797" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1797" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1797" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1797" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1797" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1797" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000576">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1446" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1446" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1446" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1446" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1446" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1446" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000585">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1617" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1617" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1617" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1617" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1617" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1617" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000588">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1586" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1586" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1586" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1586" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1586" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1586" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000598">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000599">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="600" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="600" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="600" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="600" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="600" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="600" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000600">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="540" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000601">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="912" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="912" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="912" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="912" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="912" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="912" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000602">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="928" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="928" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="928" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="928" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="928" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="928" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000603">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="34" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="34" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="34" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="34" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="34" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="34" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000608">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="930" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="930" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="930" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="930" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="930" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="930" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000609">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1110" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1110" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1110" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1110" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1110" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1110" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000611">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1500" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1500" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1500" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1500" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1500" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1500" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000612">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1505" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1505" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1505" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1505" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1505" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1505" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000613">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1585" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1585" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1585" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1585" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1585" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1585" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000614">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1656" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1656" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1656" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1656" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1656" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1656" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000615">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1746" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1746" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1746" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1746" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1746" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1746" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000616">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000617">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000618">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005838">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="211" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="211" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="211" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="211" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="211" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="211" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005839">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005841">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="265" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="265" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="265" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="265" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="265" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="265" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005843">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="245" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="245" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="245" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="245" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="245" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="245" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005845">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="237" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="237" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="237" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="237" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="237" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="237" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005850">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="238" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="238" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="238" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="238" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="238" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="238" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005851">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="46.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="46.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="46.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="46.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="46.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="46.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005852">
        <Set Vis="1" Prev="INI400_005851" Style="2" StyleName="" X="0" Y="66.7" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_005851" Style="2" StyleName="" X="0" Y="66.7" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="INI400_005851" Style="2" StyleName="" X="0" Y="66.7" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="INI400_005851" Style="2" StyleName="" X="0" Y="66.7" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="INI400_005851" Style="2" StyleName="" X="0" Y="66.7" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="INI400_005851" Style="2" StyleName="" X="0" Y="66.7" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005853">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="107" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="107" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="107" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="107" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="107" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="107" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005854">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005856">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005873">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005876">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005879">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005888">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005890">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005891">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005892">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005893">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005897">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005898">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1276" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1276" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1276" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1276" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1276" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1276" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005899">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005900">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006265">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006282">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006283">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006284">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006285">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006292">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006293">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006295">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006296">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006297">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="261" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="261" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="261" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="261" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="261" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="261" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006298">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006299">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006301">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006302">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006303">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006304">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006306">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006307">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006308">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006309">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006310">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006311">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006312">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006313">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006314">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006315">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="570" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="570" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="570" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="570" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="570" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="570" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006319">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006320">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006358">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006359">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006360">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006361">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006362">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006363">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="398" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006368">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="261" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="261" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="261" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="261" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="261" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="261" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_006369">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006370">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006371">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006372">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006373">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006374">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1727" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006375">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1727" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006431">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006432">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007941">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007942">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007972">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008013">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008014">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008015">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008016">
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
      </VC>
      <VC ID="INI400_008017">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008018">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008019">
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
      </VC>
      <VC ID="INI400_008020">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008021">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008023">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008024">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_008025">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008026">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008028">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008029">
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
      </VC>
      <VC ID="INI400_008030">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008031">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_008032">
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
      </VC>
      <VC ID="INI400_008034">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_008035">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008036">
        <Set Vis="1" Prev="" Style="0" StyleName="Calculation headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Calculation headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Calculation headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Calculation headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Calculation headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Calculation headline" EqStyle="23" />
      </VC>
      <VC ID="INI400_008037">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_008038">
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="ExternCLC" EqStyle="23" />
      </VC>
      <VC ID="INI400_008039">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008040">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008041">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008042">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_008043">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_008044">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008045">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008046">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008047">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008048">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008049">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008050">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008051">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008052">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008053">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008054">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_008055">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_008056">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008057">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_008058">
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
      </VC>
      <VC ID="INI400_008059">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|15|0|2" Font2="Arial|15|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|15|0|2" Font2="Arial|15|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|15|0|2" Font2="Arial|15|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|15|0|2" Font2="Arial|15|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|15|0|2" Font2="Arial|15|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|15|0|2" Font2="Arial|15|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_008060">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="263" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="263" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="263" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="263" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="263" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="263" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_008061">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008062">
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008063">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008064">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008065">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008066">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008067">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008068">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008069">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008070">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008071">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008072">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008073">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008074">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008075">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008076">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008077">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008078">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008079">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008080">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008081">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008082">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008083">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008084">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008085">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008086">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008087">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008088">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008089">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008090">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008091">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008092">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="BG" Content="iVBORw0KGgoAAAANSUhEUgAAAfQAAAAyCAMAAACdztmlAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAMAUExURdzk8d7m8eDm8eHo8eLo8uTp8uXq8ufs8ujs8unt8+ru8+zv8+7w8wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANvmZBkAAAAJcEhZcwAADrwAAA68AZW8ckkAAAAZdEVYdFNvZnR3YXJlAFBhaW50Lk5FVCB2My41LjenhJ3MAAAFUUlEQVR4Xu3TSY7sOBBEwZ7Hf//zdgJpIgSWR5FS5Kohi11sH/ynj/n5G7/s+zX7beX3yR+f8efZX0t/V/7Z9e93fnyGYhf9Ek7fSNAdIs+krWk9iHaPhC9yv/l9Q+KvJF2TNxOtS8UP0DcSdIfIM2lrWg/ydcn9puw3JP5K0jV5M9G6FLvovPDj9I0E3SHyTNqa1oNo90j4Iveb3zck/krSNXkz0bpU/AB9I0F3iDyTtqb1IF+X3G/K1hQOJF2TNxOtS7GLzgs/Tt9I0B0iz6StaT2Ido+GL3K/+dUUDiRdkzcTrUvFD9A3EnSHyDNpa1oP8nXJ/SZtTeFA0jV5M9G6FLvovPDj9I0E3SHyTNqa1oNo92j4IvebX03hQNI1eTPRulT8AH0jQXeIPJO2pvUgX5fcb9LWFA4kXZM3E61LsYvOCz9O30jQHSLPpK1pPYh2j4Yvcr/51RQOJF2TNxOtS8UP0DcSdIfIM2lrWg/ydcn9Jm1N4UDSNXkz0boUu+i88OP0jQTdIfJM2prWg2j3aPgi95tfTeFA0jV5M9G6VPwAfSNBd4g8k7am9SBfl9xv0tYUDiRdkzcTrUuxi84LP07fSNAdIs+krWk9iHaPhi9yv/nVFA4kXZM3E61LxQ/QNxJ0h8gzaWtaD/I1qY20NYUDSdfkzUTrUuyi88KP0zcSdIfIM2lrWg+q3aPhNPRn6V/oGwm6Q+SZtDWtB/ma1EbamsKBpGvyZqJ1KXbReeHH6RsJukPkmbQ1rQfV7tHwWfqKvpGgO0SeSVvTepCvSW2krSkcSLombyZal2IXnRd+nL6RoDtEnklb03pQ7R4Nn6Wv6BsJukPkmbQ1rQf5mtRG2prCgaRr8maidSl20Xnhx+kbCbpD5Jm0Na0H1e7R8Fn6ir6RoDtEnklb03qQr0ltpK0pHEi6Jm8mWpdiF50Xfpy+kaA7RJ5JW9N6UO0eDZ+lr+gbCbpD5Jm0Na0H+ZrURtqawoGka/JmonUpdtF54cfpGwm6Q+SZtDWtB9Xu0fBZ+oq+kaA7RJ5JW9N6kK9JbaStKRxIuiZvJlqXYhedF36cvpGgO0SeSVvTelDtHg2fpa/oGwm6Q+SZtDWtB/ma1EbamsKBpGvyZqJ1KXbReeHH6RsJukPkmbQ1rQfV7tHwWfqKvpGgO0SeSVvTepCvSW2krSkcSLombyZal2IXnRd+nL6RoDtEnklb03pQ7R4Nn6Wv6BsJukPkmbQ1rQf5mtRG2prCgaRr8maidSl20Xnhx+kbCbpD5Jm0Na0H1e7R8Fn6ir6RoDtEnklb03qQr0ltpK0pHEi6Jm8mWpdiF50Xfpy+kaA7RJ5JW9N6UO0eDZ+lr+gbCbpD5Jm0Na0H+ZrURtqawoGka/JmonUpdtF54cfpm+i5ReSZtDWtB9Xu0fBZ+orAiZ5bRJ5JW9N6kK9JbaStKRxIuiZvJlqXYhedF36cwImeW0SeSVvTelDtHg2fpa8InOi5ReSZtDWtB/ma1EbamsKBpGvyZqJ1KXbReeHHCZzouUXkmbQ1rQfV7tHwWfqKwImeW0SeSVvTepCvSW2krSkcSLombyZal2IXnRd+nMCJnltEnklb03pQ7R4Nn6WvCJzouUXkmbQ1rQf5mtRG2prCgaRr8maidSl20Xnhxwmc6LlF5Jm0Na0H1e7R8Fn6isCJnltEnklb03qQr0ltpK0pHEi6Jm8mWpdiF50XfpzAiZ5bRJ5JW9N6UO0eDZ+lrwic6LlF5Jm0Na0H+ZrURtqawoGka/JmonUpdtF54ccJnOi5ReSZtDWtB9Xu0fD/ufQfP/4DQ2dMPsYxicoAAAAASUVORK5CYII=" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="472">
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="False" TabIndex="0" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
        <Texts>
          <ENU>
          </ENU>
        </Texts>
        <TPanel Name="" ID="58" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|300" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
          <Texts TranslateID="DIALOG_000058">
            <ENU>Load</ENU>
          </Texts>
          <TTableInput Name="CombiTable" ID="44" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Segoe UI|9|1|3" VarName="InternalForces" Value="" CellBG="-1" HeaderBG="-2300161" FixedRows="-1">
            <Texts TranslateID="DIALOG_000044">
              <ENU>Normal force [kN]|Shear force [kN]|Shear force [kN]|Torsion moment [kNm]|Bending moment My [kNm]|Bending moment Mz [kNm]</ENU>
            </Texts>
            <Columns>
              <Column Sort="True" Name="N" Description="Normal force [kN]" Type="Numeric">
                <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
              </Column>
              <Column Sort="True" Name="Vy" Description="Shear force [kN]" Type="Numeric">
                <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
              </Column>
              <Column Sort="True" Name="Vz" Description="Shear force [kN]" Type="Numeric">
                <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
              </Column>
              <Column Sort="True" Name="Mx" Description="Torsion moment [kNm]" Type="Numeric">
                <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
              </Column>
              <Column Sort="True" Name="My" Description="Bending moment My [kNm]" Type="Numeric">
                <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
              </Column>
              <Column Sort="True" Name="Mz" Description="Bending moment Mz [kNm]" Type="Numeric">
                <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
              </Column>
            </Columns>
          </TTableInput>
          <TCheckBox Name="" ID="60" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="FullTable" BookMarkID="" ForeColor="-16711423" ChbRight="True">
            <Texts TranslateID="DIALOG_000060">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TPanel>
        <TPanel Name="" ID="80" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
          <Texts TranslateID="DIALOG_000080">
            <ENU>Design settings</ENU>
          </Texts>
          <TGroupBox Name="" ID="87" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|0|0|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
            <Texts TranslateID="DIALOG_000087">
              <ENU>Additional settings</ENU>
            </Texts>
            <TCheckBox Name="" ID="88" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="DesignMinimumAs" BookMarkID="" ForeColor="-16711423" ChbRight="True">
              <Texts TranslateID="DIALOG_000088">
                <ENU>
                </ENU>
              </Texts>
            </TCheckBox>
          </TGroupBox>
          <TGroupBox Name="" ID="81" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
            <Texts TranslateID="DIALOG_000081">
              <ENU>Reinforcement design</ENU>
            </Texts>
            <TDoubleInput Name="TDoubleInput" ID="84" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="Φ↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
            <TDoubleInput Name="" ID="85" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="c↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
            <TDoubleInput Name="TDoubleInput" ID="82" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="Φ↓2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
            <TDoubleInput Name="" ID="83" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="c↓2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          </TGroupBox>
        </TPanel>
        <TPanel Name="" ID="53" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
          <Texts TranslateID="DIALOG_000053">
            <ENU>Cross section</ENU>
          </Texts>
          <TGroupBox Name="" ID="63" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
            <Texts TranslateID="DIALOG_000063">
              <ENU>Reinforcement design</ENU>
            </Texts>
            <TDoubleInput Name="TDoubleInput" ID="66" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="b" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
            <TDoubleInput Name="" ID="67" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="h" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          </TGroupBox>
        </TPanel>
        <TPanel Name="" ID="51" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
          <Texts TranslateID="DIALOG_000051">
            <ENU>Materials</ENU>
          </Texts>
          <TCustomLibrary Name="" ID="68" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="Reinf.EC" DataFile="EC_Reinf.xml" Collapsed="True" UseCombo="False" Category="Inclined top branch" Item="B 550 A ONORM">
            <Data>
              <Header>
                <PropertySet Symbol="f↓yk←" ESA_ID="fyk" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="k" ESA_ID="k" Unit="" Type="Numeric" />
                <PropertySet Symbol="f↓tk←" ESA_ID="ftk" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓yd←" ESA_ID="fyd" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="ε↓υκ←" ESA_ID="eps_uk" Unit="" Type="Numeric" />
                <PropertySet Symbol="ε↓ud←" ESA_ID="eps_ud" Unit="" Type="Numeric" />
                <PropertySet Symbol="ε↓s1←" ESA_ID="eps_s1" Unit="" Type="Numeric" />
                <PropertySet Symbol="E↓s←" ESA_ID="Es" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="Class" ESA_ID="Class" Unit="" Type="String" />
                <PropertySet Symbol="Inclined" ESA_ID="Inclined" Unit="" Type="Bool" />
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="MPa" />
                  </StructMembers>
                </PropertySet>
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="MPa" />
                  </StructMembers>
                </PropertySet>
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="MPa" />
                  </StructMembers>
                </PropertySet>
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="MPa" />
                  </StructMembers>
                </PropertySet>
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="MPa" />
                  </StructMembers>
                </PropertySet>
              </Header>
              <Items>
                <Item>
                  <P>Inclined top branch</P>
                  <P>B 550 A ONORM</P>
                  <P>550</P>
                  <P>1.05</P>
                  <P>578</P>
                  <P>478.30</P>
                  <P>0.025</P>
                  <P>0.0225</P>
                  <P>0.002391305</P>
                  <P>200000</P>
                  <P>A</P>
                  <P>true</P>
                  <P>-0.025;-502.72;</P>
                  <P>-0.0024;-478.26;</P>
                  <P>0;0;</P>
                  <P>0.0024;478.26;</P>
                  <P>0.025;502.72;</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
          <TLabel Name="" ID="78" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="5|5|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
            <Texts TranslateID="DIALOG_000078">
              <ENU>Reinforcement:</ENU>
            </Texts>
          </TLabel>
          <TCustomLibrary Name="ECSteel" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="CONCRETE.EC" DataFile="EC_Concrete.xml" Collapsed="True" UseCombo="False" Category="Bilinear" Item="C 12/15">
            <Data>
              <Header>
                <PropertySet Symbol="f↓ck←" ESA_ID="fck" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓ck,cube←" ESA_ID="fckcube" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓cm←" ESA_ID="fcm" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓ctm←" ESA_ID="fctm" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓ctk, 0.05←" ESA_ID="fctk_05" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓ctk, 0.95←" ESA_ID="fctk_95" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="E↓cm←" ESA_ID="Ecm" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="ε↓c1←" ESA_ID="eps_c1" Unit="‰" Type="Numeric" />
                <PropertySet Symbol="ε↓cu1←" ESA_ID="eps_cu1" Unit="‰" Type="Numeric" />
                <PropertySet Symbol="ε↓c2←" ESA_ID="eps_c2" Unit="‰" Type="Numeric" />
                <PropertySet Symbol="ε↓cu2←" ESA_ID="eps_cu2" Unit="‰" Type="Numeric" />
                <PropertySet Symbol="ε↓c3←" ESA_ID="eps_c3" Unit="‰" Type="Numeric" />
                <PropertySet Symbol="ε↓cu3←" ESA_ID="eps_cu3" Unit="‰" Type="Numeric" />
                <PropertySet Symbol="n" ESA_ID="n" Unit="" Type="Numeric" />
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="Pa" />
                  </StructMembers>
                </PropertySet>
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="Pa" />
                  </StructMembers>
                </PropertySet>
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="Pa" />
                  </StructMembers>
                </PropertySet>
                <PropertySet Symbol="Bilinear" ESA_ID="Bilinear" Unit="" Type="Bool" />
                <PropertySet Symbol="d↓g←" ESA_ID="dg" Unit="mm" Type="Numeric" />
                <PropertySet Symbol="μ" ESA_ID="μ" Unit="" Type="Numeric" />
                <PropertySet Symbol="ρ" ESA_ID="ρ" Unit="kg/m↑3←" Type="Numeric" />
                <PropertySet Symbol="G" ESA_ID="G" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="υ" ESA_ID="υ" Unit="" Type="Numeric" />
                <PropertySet Symbol="λ" ESA_ID="λ" Unit="W/m*K" Type="Numeric" />
                <PropertySet Symbol="c" ESA_ID="c" Unit="J/kg*K" Type="Numeric" />
                <PropertySet Symbol="α" ESA_ID="α" Unit="" Type="Numeric" />
              </Header>
              <Items>
                <Item>
                  <P>Bilinear</P>
                  <P>C 12/15</P>
                  <P>12</P>
                  <P>15</P>
                  <P>20</P>
                  <P>1.6</P>
                  <P>1.1</P>
                  <P>2</P>
                  <P>27</P>
                  <P>1.8</P>
                  <P>3.5</P>
                  <P>2</P>
                  <P>3.5</P>
                  <P>1.75</P>
                  <P>3.5</P>
                  <P>2</P>
                  <P>0;0;</P>
                  <P>-0.00175;-8000000;</P>
                  <P>-0.0035;-8000000;</P>
                  <P>true</P>
                  <P>32</P>
                  <P>0.2</P>
                  <P>2500</P>
                  <P>11.3</P>
                  <P>0.2</P>
                  <P>4500</P>
                  <P>0.0006</P>
                  <P>1.00E-05</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
          <TLabel Name="" ID="77" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
            <Texts TranslateID="DIALOG_000077">
              <ENU>Concrete:</ENU>
            </Texts>
          </TLabel>
        </TPanel>
        <TPanel Name="" ID="31" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
          <Texts>
            <ENU>
            </ENU>
          </Texts>
          <TCustomLibrary Name="SteelProductLib" ID="42" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="30" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="STEEL.PC" DataFile="EC_Steel_Product_List.xml" Collapsed="True" UseCombo="False" Category="3 mm &lt; t &lt;= 16 mm" Item="S 235 JR (EN 10025-2)">
            <Data>
              <Header>
                <PropertySet Symbol="f↓y←" ESA_ID="fy" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓u←" ESA_ID="fu" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="E" ESA_ID="E" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="G" ESA_ID="G" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="ν" ESA_ID="ν" Unit="" Type="Numeric" />
                <PropertySet Symbol="γ" ESA_ID="γ" Unit="kg/m↑3←" Type="Numeric" />
                <PropertySet Symbol="α" ESA_ID="α" Unit="10↑-6←" Type="Numeric" />
              </Header>
              <Items>
                <Item>
                  <P>3 mm &lt; t &lt;= 16 mm</P>
                  <P>S 235 JR (EN 10025-2)</P>
                  <P>235</P>
                  <P>360</P>
                  <P>210</P>
                  <P>80.77</P>
                  <P>0.3</P>
                  <P>7850</P>
                  <P>12</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
        </TPanel>
        <TPanel Name="" ID="48" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="True">
          <Texts TranslateID="DIALOG_000048">
            <ENU>General settings</ENU>
          </Texts>
          <TGroupBox Name="" ID="59" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
            <Texts TranslateID="DIALOG_000059">
              <ENU>Layout blocks</ENU>
            </Texts>
            <TCheckBox Name="TCheckBox" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Print_ReinfMat" BookMarkID="" ForeColor="-16711423" ChbRight="False">
              <Texts TranslateID="DIALOG_000004">
                <ENU>
                </ENU>
              </Texts>
            </TCheckBox>
            <TCheckBox Name="TCheckBox" ID="76" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Print_ConcreteMat" BookMarkID="" ForeColor="-16711423" ChbRight="False">
              <Texts TranslateID="DIALOG_000076">
                <ENU>
                </ENU>
              </Texts>
            </TCheckBox>
            <TCheckBox Name="TCheckBox" ID="23" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="PrintLoadTable" BookMarkID="" ForeColor="-16711423" ChbRight="False">
              <Texts TranslateID="DIALOG_000023">
                <ENU>
                </ENU>
              </Texts>
            </TCheckBox>
            <TCheckBox Name="TCheckBox" ID="3" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="PrintSection" BookMarkID="" ForeColor="-16711423" ChbRight="False">
              <Texts TranslateID="DIALOG_000003">
                <ENU>
                </ENU>
              </Texts>
            </TCheckBox>
          </TGroupBox>
          <TGroupBox Name="" ID="45" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
            <Texts TranslateID="DIALOG_000045">
              <ENU>Headline settings</ENU>
            </Texts>
            <TCheckBox Name="TCheckBox" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
              <Texts TranslateID="DIALOG_000002">
                <ENU>
                </ENU>
              </Texts>
            </TCheckBox>
            <TStringInput Name="TStringInput" ID="30" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Headline" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
            <TCheckBox Name="TCheckBox" ID="26" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="PrintUserHeadline" BookMarkID="" ForeColor="-16711423" ChbRight="False">
              <Texts TranslateID="DIALOG_000026">
                <ENU>
                </ENU>
              </Texts>
            </TCheckBox>
          </TGroupBox>
          <TGroupBox Name="" ID="40" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
            <Texts TranslateID="DIALOG_000040">
              <ENU>National Annex</ENU>
            </Texts>
            <TCustomLibrary Name="" ID="35" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="Standard EN">
              <Data>
                <Header>
                  <PropertySet Symbol="Code" ESA_ID="EC_NA.Code" Unit="" Type="String" />
                  <PropertySet Symbol="Index" ESA_ID="EC_NA.Index" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1990 - Name" ESA_ID="EC_1990.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1991.1.1 - Name" ESA_ID="EC_1991_1_1.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1991.1.2 - Name" ESA_ID="EC_1991_1_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1991.1.3 - Name" ESA_ID="EC_1991_1_3.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1991.1.3 - AnnexA" ESA_ID="EC_1991_1_3.AnnexA" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.3 - s↓k←" ESA_ID="EC_1991_1_3.s_k" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.3 - C↓esl←" ESA_ID="EC_1991_1_3.C_esl" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="Use_C_esl" Type="Bool" Unit="" />
                      <StructMember Symbol="C_esl" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1991.1.3 - SnowRedi" ESA_ID="EC_1991_1_3.Snow_Redi" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.3 - C↓e←" ESA_ID="EC_1991_1_3.C_e" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.3 - C↓t←" ESA_ID="EC_1991_1_3.C_t" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.3 - μ↓1←" ESA_ID="EC_1991_1_3.μ_1_pitched" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.3 - Annex B" ESA_ID="EC_1991_1_3.Annex_B_5_3_4_3" Unit="" Type="Bool" />
                  <PropertySet Symbol="EC 1991.1.3 - μ↓2←" ESA_ID="EC_1991_1_3.μ_2" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.3 - μ↓3,max←" ESA_ID="EC_1991_1_3.μ_3_max" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.3 - μ↓3←" ESA_ID="EC_1991_1_3.μ_3" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.3 - μ↓W←, l↓s←" ESA_ID="EC_1991_1_3.μ_W" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="μ_W_min" Type="Numeric" Unit="" />
                      <StructMember Symbol="μ_W_max" Type="Numeric" Unit="" />
                      <StructMember Symbol="l_s_min" Type="Numeric" Unit="m" />
                      <StructMember Symbol="l_s_max" Type="Numeric" Unit="m" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1991.1.3 - Annex B" ESA_ID="EC_1991_1_3.Annex_B_5_3_6_3" Unit="" Type="Bool" />
                  <PropertySet Symbol="EC 1991.1.3 - Annex B" ESA_ID="EC_1991_1_3.Annex_B_6_2_2" Unit="" Type="Bool" />
                  <PropertySet Symbol="EC 1991.1.3 - Usage" ESA_ID="EC_1991_1_3.Usage_6_2_2" Unit="" Type="Bool" />
                  <PropertySet Symbol="EC 1991.1.3 - k" ESA_ID="EC_1991_1_3.k" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.4 - Name" ESA_ID="EC_1991_1_4.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1991.1.4 - v↓m←" ESA_ID="EC_1991_1_4.v_m" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.4 - v↓b,0←" ESA_ID="EC_1991_1_4.v_b_0" Unit="m/s" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.4 - c↓dir←" ESA_ID="EC_1991_1_4.c_dir" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.4 - c↓season←" ESA_ID="EC_1991_1_4.c_season" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.4 - K, n" ESA_ID="EC_1991_1_4.K_n" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="K" Type="Numeric" Unit="" />
                      <StructMember Symbol="n" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1991.1.4 - DesChar" ESA_ID="EC_1991_1_4.Des_Char" Unit="" Type="Bool" />
                  <PropertySet Symbol="EC 1991.1.4 - c↓r←(z)" ESA_ID="EC_1991_1_4.c_r" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.4 - c↓O←" ESA_ID="EC_1991_1_4.c_O" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="OrtInBasic" Type="Bool" Unit="" />
                      <StructMember Symbol="cO" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1991.1.4 - Use of A.4" ESA_ID="EC_1991_1_4.Use_A4" Unit="" Type="Bool" />
                  <PropertySet Symbol="EC 1991.1.4 - Use A.5" ESA_ID="EC_1991_1_4.Use_A5" Unit="" Type="Bool" />
                  <PropertySet Symbol="EC 1991.1.4 - k↓I←" ESA_ID="EC_1991_1_4.k_I" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.4 - q↓p←" ESA_ID="EC_1991_1_4.q_p" Unit="kPa" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.4 - ρ" ESA_ID="EC_1991_1_4.roo" Unit="kg/m↑3←" Type="Numeric" />
                  <PropertySet Symbol="c↓s←c↓d←_sep" ESA_ID="EC_1991_1_4.cs_cd_sep" Unit="" Type="Bool" />
                  <PropertySet Symbol="Use B" ESA_ID="EC_1991_1_4.Use_B" Unit="" Type="Bool" />
                  <PropertySet Symbol="C↓pe←" ESA_ID="EC_1991_1_4.C_pe" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1991.1.5 - Name" ESA_ID="EC_1991_1_5.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1991.1.6 - Name" ESA_ID="EC_1991_1_6.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1991.1.7 - Name" ESA_ID="EC_1991_1_7.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1991.2 - Name" ESA_ID="EC_1991_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1991.3 - Name" ESA_ID="EC_1991_3.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1991.4 - Name" ESA_ID="EC_1991_4.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1992.1.1 - Name" ESA_ID="EC_1992_1_1.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1992.1.1 - γ↓SH←" ESA_ID="EC_1992_1_1.γ_SH" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - γ↓P,fav←" ESA_ID="EC_1992_1_1.γ_P_fav" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - γ↓P,unfav←" ESA_ID="EC_1992_1_1.γ_P_unfav" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - γ↓P,unfav,l←" ESA_ID="EC_1992_1_1.γ_P_unfav_l" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - Table 2.1N" ESA_ID="EC_1992_1_1.T_21N" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="γ_C_Per" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_SR_Per" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_SP_Per" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_C_Acc" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_SR_Acc" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_SP_Acc" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - γ↓Ser←" ESA_ID="EC_1992_1_1.γ_Ser" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="γ_C_Ser" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_S_Ser" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - C↓max←" ESA_ID="EC_1992_1_1.C_max" Unit="MPa" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - k↓t←" ESA_ID="EC_1992_1_1.k_t" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - α↓cc←" ESA_ID="EC_1992_1_1.α_cc" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - α↓ct←" ESA_ID="EC_1992_1_1.α_ct" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - f↓yk,max←" ESA_ID="EC_1992_1_1.f_yk_max" Unit="MPa" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - X*ε↓uk←" ESA_ID="EC_1992_1_1.X_ε_uk" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - k" ESA_ID="EC_1992_1_1.k" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - ε↓ud←" ESA_ID="EC_1992_1_1.ε_ud" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="X_ε_uk" Type="Numeric" Unit="" />
                      <StructMember Symbol="ε_ud" Type="Numeric" Unit="" />
                      <StructMember Symbol="f_p01k_fpk" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - c↓min,b,coef←" ESA_ID="EC_1992_1_1.c_min_b_coef" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="pre_strand_wire" Type="Numeric" Unit="" />
                      <StructMember Symbol="pre_indented_wire" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - Δc↓dur,γ←" ESA_ID="EC_1992_1_1.Δc_dur_γ" Unit="mm" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - Δc↓dur,st←" ESA_ID="EC_1992_1_1.Δc_dur_st" Unit="mm" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - Δc↓dur,add←" ESA_ID="EC_1992_1_1.Δc_dur_add" Unit="mm" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - Δc↓min,abr←" ESA_ID="EC_1992_1_1.Δc_min_abr" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="k_1" Type="Numeric" Unit="mm" />
                      <StructMember Symbol="k_2" Type="Numeric" Unit="mm" />
                      <StructMember Symbol="k_3" Type="Numeric" Unit="mm" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - Δc↓dev←" ESA_ID="EC_1992_1_1.Δ_c_dev0" Unit="mm" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - Δc↓dev←" ESA_ID="EC_1992_1_1.Δc_dev" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="Δc_dev_min_acc" Type="Numeric" Unit="mm" />
                      <StructMember Symbol="Δc_dev_min" Type="Numeric" Unit="mm" />
                      <StructMember Symbol="Δc_dev_max" Type="Numeric" Unit="mm" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - c↓min,une←" ESA_ID="EC_1992_1_1.c_min_une" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="k_1" Type="Numeric" Unit="mm" />
                      <StructMember Symbol="k_2" Type="Numeric" Unit="mm" />
                      <StructMember Symbol="k_3" Type="Numeric" Unit="mm" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - θ↓0←" ESA_ID="EC_1992_1_1.θ_0" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - k↓lin←" ESA_ID="EC_1992_1_1.k_lin" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="k_1" Type="Numeric" Unit="" />
                      <StructMember Symbol="k_2" Type="Numeric" Unit="" />
                      <StructMember Symbol="k_3" Type="Numeric" Unit="" />
                      <StructMember Symbol="k_4" Type="Numeric" Unit="" />
                      <StructMember Symbol="k_5" Type="Numeric" Unit="" />
                      <StructMember Symbol="k_6" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - λ↓lim←" ESA_ID="EC_1992_1_1.λ_lim" Unit="" Type="Numeric" />
                  <PropertySet Symbol="γ↓cE←" ESA_ID="EC_1992_1_1.γ_cE" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - k↓5.10.2.1.1←" ESA_ID="EC_1992_1_1.k_5_10_2_1_1" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="k_1" Type="Numeric" Unit="" />
                      <StructMember Symbol="k_2" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - k↓5.10.2.1.2←" ESA_ID="EC_1992_1_1.k_5_10_2_1_2" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - k↓5.10.2.2.4←" ESA_ID="EC_1992_1_1.k_5_10_2_2_4" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="k_4" Type="Numeric" Unit="%" />
                      <StructMember Symbol="k_5" Type="Numeric" Unit="%" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - k↓5.10.2.2.5←" ESA_ID="EC_1992_1_1.k_5_10_2_2_5" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - k↓5.10.3.2←" ESA_ID="EC_1992_1_1.k_5_10_3_2" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="k_7" Type="Numeric" Unit="" />
                      <StructMember Symbol="k_8" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - r↓sup,inf←" ESA_ID="EC_1992_1_1.r_sup_inf" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="r_sup_preten" Type="Numeric" Unit="" />
                      <StructMember Symbol="r_inf_preten" Type="Numeric" Unit="" />
                      <StructMember Symbol="r_sup_postten" Type="Numeric" Unit="" />
                      <StructMember Symbol="r_inf_postten" Type="Numeric" Unit="" />
                      <StructMember Symbol="r_sup_precise" Type="Numeric" Unit="" />
                      <StructMember Symbol="r_inf_precise" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - C↓Rd,c←, v↓min←, k↓1←" ESA_ID="EC_1992_1_1.C_6_2_2_1" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="C_Rd_c" Type="Numeric" Unit="" />
                      <StructMember Symbol="v_min" Type="Numeric" Unit="" />
                      <StructMember Symbol="k_1" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - ν" ESA_ID="EC_1992_1_1.ν" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - θ" ESA_ID="EC_1992_1_1.θ" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="θ_min" Type="Numeric" Unit="rad" />
                      <StructMember Symbol="θ_max" Type="Numeric" Unit="rad" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - ν↓1←_α↓cw←" ESA_ID="EC_1992_1_1.ν_1_α_cw" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="ν_1" Type="Numeric" Unit="" />
                      <StructMember Symbol="α_cw" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - θ↓f,lim←" ESA_ID="EC_1992_1_1.θ_f_lim" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="θ_f_min_comp" Type="Numeric" Unit="°" />
                      <StructMember Symbol="θ_f_max_comp" Type="Numeric" Unit="°" />
                      <StructMember Symbol="θ_f_min_tens" Type="Numeric" Unit="°" />
                      <StructMember Symbol="θ_f_max_tens" Type="Numeric" Unit="°" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - k↓6.2.4.6←" ESA_ID="EC_1992_1_1.k_6_2_4_6" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - β" ESA_ID="EC_1992_1_1.β" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="β_A" Type="Numeric" Unit="" />
                      <StructMember Symbol="β_B" Type="Numeric" Unit="" />
                      <StructMember Symbol="β_C" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - c↓Rd,c,punch←" ESA_ID="EC_1992_1_1.c_Rd_c_punch" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="c_Rd_c" Type="Numeric" Unit="" />
                      <StructMember Symbol="ν_min" Type="Numeric" Unit="" />
                      <StructMember Symbol="k_1" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - v↓Rd,max←" ESA_ID="EC_1992_1_1.v_Rd_max" Unit="MPa" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - ν↓strut←" ESA_ID="EC_1992_1_1.ν_strut" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - k↓6.5.4.4←" ESA_ID="EC_1992_1_1.k_6_5_4_4" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="k_1" Type="Numeric" Unit="" />
                      <StructMember Symbol="k_2" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - k↓1←" ESA_ID="EC_1992_1_1.k_1" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - k↓2←" ESA_ID="EC_1992_1_1.k_2" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - k↓3←, k↓4←, k↓5←" ESA_ID="EC_1992_1_1.k_7_2_5" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="k_3" Type="Numeric" Unit="" />
                      <StructMember Symbol="k_4" Type="Numeric" Unit="" />
                      <StructMember Symbol="k_5" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - w↓max←" ESA_ID="EC_1992_1_1.w_max" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="Quasi_X0_XC1" Type="Numeric" Unit="mm" />
                      <StructMember Symbol="Quasi_XC2_XC3_XC4" Type="Numeric" Unit="mm" />
                      <StructMember Symbol="Quasi_XD1_XD2_XS1_XS2_XS3" Type="Numeric" Unit="mm" />
                      <StructMember Symbol="Freq_X0_XC1" Type="Numeric" Unit="mm" />
                      <StructMember Symbol="Freq_XC2_XC3_XC4" Type="Numeric" Unit="mm" />
                      <StructMember Symbol="Freq_XD1_XD2_XS1_XS2_XS3" Type="Numeric" Unit="mm" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - k↓3←, k↓4←" ESA_ID="EC_1992_1_1.k_7_3_4_3" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="k_3" Type="Numeric" Unit="" />
                      <StructMember Symbol="k_4" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - k↓8.2.2←" ESA_ID="EC_1992_1_1.k_8_2_2" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="k_1" Type="Numeric" Unit="" />
                      <StructMember Symbol="k_2" Type="Numeric" Unit="mm" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - ϕ↓m,min←" ESA_ID="EC_1992_1_1.ϕ_m_min" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - F↓btd←" ESA_ID="EC_1992_1_1.F_btd" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - ϕ↓large←" ESA_ID="EC_1992_1_1.ϕ_large" Unit="mm" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - A↓s,min←" ESA_ID="EC_1992_1_1.A_s_min" Unit="mm↑2←" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - A↓s,max←" ESA_ID="EC_1992_1_1.A_s_max" Unit="mm↑2←" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - β↓1←" ESA_ID="EC_1992_1_1.β_1" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - β↓2←" ESA_ID="EC_1992_1_1.β_2" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - β↓3←" ESA_ID="EC_1992_1_1.β_3" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - ρ↓w,min←" ESA_ID="EC_1992_1_1.ρ_w_min" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - s↓l,max←" ESA_ID="EC_1992_1_1.s_l_max" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - s↓b,max←" ESA_ID="EC_1992_1_1.s_b_max" Unit="mm" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - s↓t,max←" ESA_ID="EC_1992_1_1.s_t_max" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - s↓max,slab←" ESA_ID="EC_1992_1_1.s_max_slab" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - ϕ↓min←" ESA_ID="EC_1992_1_1.ϕ_min" Unit="mm" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - A↓s,min←" ESA_ID="EC_1992_1_1.A_s_min_det" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - A↓s,max←" ESA_ID="EC_1992_1_1.A_s_max_det" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - s↓cl,tmax←" ESA_ID="EC_1992_1_1.s_cl_tmax" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - A↓s,vmin← A↓s,vmax←" ESA_ID="EC_1992_1_1.A_sv" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - A↓s,hmin←" ESA_ID="EC_1992_1_1.A_s_hmin" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - A↓s,dbmin←" ESA_ID="EC_1992_1_1.A_s_dbmin" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - ϕ↓min←" ESA_ID="EC_1992_1_1.ϕ_min_pile" Unit="mm" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - ϕ↓min←" ESA_ID="EC_1992_1_1.ϕ_min_gen" Unit="mm" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - ϕ↓min←" ESA_ID="EC_1992_1_1.ϕ_min_tie" Unit="mm" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - q↓1←" ESA_ID="EC_1992_1_1.q_1" Unit="kN/m" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - ϕ↓min←, q↓2←" ESA_ID="EC_1992_1_1.q_2" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="q_2" Type="Numeric" Unit="MPa" />
                      <StructMember Symbol="ϕ_min" Type="Numeric" Unit="mm" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - h↓1←, A↓s,bpmin←" ESA_ID="EC_1992_1_1.h_1" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="h1" Type="Numeric" Unit="mm" />
                      <StructMember Symbol="A↓s,bpmin←" Type="Numeric" Unit="mm↑2←" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - α↓cc,pl←, α↓ct,pl←" ESA_ID="EC_1992_1_1.α_cpl" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="α↓cc,pl←" Type="Numeric" Unit="" />
                      <StructMember Symbol="α↓ct,pl←" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1992.1.1 - k" ESA_ID="EC_1992_1_1.k_12_6_3_2" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - k↓1←" ESA_ID="EC_1992_1_1.J3_k1" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.1 - k↓2←" ESA_ID="EC_1992_1_1.J3_k2" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1992.1.2 - Name" ESA_ID="EC_1992_1_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1992.2 - Name" ESA_ID="EC_1992_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1992.3 - Name" ESA_ID="EC_1992_3.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.1.1 - Name" ESA_ID="EC_1993_1_1.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.1.1 - f↓y← f↓u←" ESA_ID="EC_1993_1_1.f" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="f_y" Type="Numeric" Unit="MPa" />
                      <StructMember Symbol="f_u" Type="Numeric" Unit="MPa" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1993.1.1 - γ↓M←" ESA_ID="EC_1993_1_1.γ_M" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="γ_M0" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M1" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M2" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1993.1.2 - Name" ESA_ID="EC_1993_1_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.1.3 - Name" ESA_ID="EC_1993_1_3.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.1.4 - Name" ESA_ID="EC_1993_1_4.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.1.5 - Name" ESA_ID="EC_1993_1_5.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.1.5 - η" ESA_ID="EC_1993_1_5.η" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="η1" Type="Numeric" Unit="" />
                      <StructMember Symbol="η2" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1993.1.6 - Name" ESA_ID="EC_1993_1_6.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.1.7 - Name" ESA_ID="EC_1993_1_7.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.1.8 - Name" ESA_ID="EC_1993_1_8.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.1.8 - γ↓M←" ESA_ID="EC_1993_1_8.γ_M" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="γ_M2" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M3" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M3_ser" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M4" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M5" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M6_ser" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M7" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1993.1.9 - Name" ESA_ID="EC_1993_1_9.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.1.10 - Name" ESA_ID="EC_1993_1_10.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.1.11 - Name" ESA_ID="EC_1993_1_11.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.1.12 - Name" ESA_ID="EC_1993_1_12.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.2 - Name" ESA_ID="EC_1993_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.2 - γ↓Mi←" ESA_ID="EC_1993_2.γ_Mi" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="γ_M0" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M1" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M2" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M3" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M3_ser" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M4" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M5" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M6_ser" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_M7" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1993.3.1 - Name" ESA_ID="EC_1993_3_1.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.3.2 - Name" ESA_ID="EC_1993_3_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.4.1 - Name" ESA_ID="EC_1993_4_1.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.4.2 - Name" ESA_ID="EC_1993_4_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.4.3 - Name" ESA_ID="EC_1993_4_3.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.5 - Name" ESA_ID="EC_1993_5.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1993.6 - Name" ESA_ID="EC_1993_6.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1994.1.1 - Name" ESA_ID="EC_1994_1_1.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1994.1.1 - γ↓P←" ESA_ID="EC_1994_1_1.γ_P" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="γ_P_fav" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_P_unfav" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1994.1.1 - γ↓V←" ESA_ID="EC_1994_1_1.γ_V_1" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.1 - γ↓VS←" ESA_ID="EC_1994_1_1.γ_VS_1" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.1 - γ↓Mf,s←" ESA_ID="EC_1994_1_1.γ_Mf_s_1" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.1 - δ" ESA_ID="EC_1994_1_1.δ" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="δ_dry_nc" Type="Numeric" Unit="" />
                      <StructMember Symbol="δ_dry_lc" Type="Numeric" Unit="" />
                      <StructMember Symbol="δ_other_nc" Type="Numeric" Unit="" />
                      <StructMember Symbol="δ_other_lc" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1994.1.1 - t↓min←" ESA_ID="EC_1994_1_1.t_min" Unit="mm" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.1 - h↓max←" ESA_ID="EC_1994_1_1.h_max" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.1 - γ↓V←" ESA_ID="EC_1994_1_1.γ_V_2" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="γ_V1" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ_V2" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1994.1.1 - rec" ESA_ID="EC_1994_1_1.rec" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.1 - 6.6.4.1" ESA_ID="EC_1994_1_1.6_6_4_1" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.1 - γ↓Mf,s←" ESA_ID="EC_1994_1_1.γ_Mf_s_2" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.1 - γ↓Ff←" ESA_ID="EC_1994_1_1.γ_Ff" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.1 - (b↓r←/b↓s←)↓max←" ESA_ID="EC_1994_1_1.br_bs_max" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.1 - δ↓s,max←" ESA_ID="EC_1994_1_1.δ_s_max" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.1 - γ↓VS←" ESA_ID="EC_1994_1_1.γ_VS_2" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.1 - γ↓VS←" ESA_ID="EC_1994_1_1.γ_VS_3" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.1 - μ" ESA_ID="EC_1994_1_1.mu" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.1 - γ↓V←" ESA_ID="EC_1994_1_1.γ_V_3" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.1 - γ↓VS←" ESA_ID="EC_1994_1_1.γ_VS_4" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1994.1.2 - Name" ESA_ID="EC_1994_1_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1994.2 - Name" ESA_ID="EC_1994_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1995.1.1 - Name" ESA_ID="EC_1995_1_1.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1995.1.1 - γ↓M←" ESA_ID="EC_1995_1_1.γ_M" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1995.1.1 - k↓cr←" ESA_ID="EC_1995_1_1.k_cr" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="Solid" Type="Numeric" Unit="" />
                      <StructMember Symbol="Glued" Type="Numeric" Unit="" />
                      <StructMember Symbol="Other" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1995.1.2 - Name" ESA_ID="EC_1995_1_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1995.2 - Name" ESA_ID="EC_1995_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1996.1.1 - Name" ESA_ID="EC_1996_1_1.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1996.1.1 - γ↓M←" ESA_ID="EC_1996_1_1.γ_M" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1996.1.1 - γ↓M←" ESA_ID="EC_1996_1_1.γ_M_ser" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1996.1.1 - M" ESA_ID="EC_1996_1_1.M" Unit="" Type="Numeric">
                    <StructMembers>
                      <StructMember Symbol="Cement" Type="Numeric" Unit="" />
                      <StructMember Symbol="Lime" Type="Numeric" Unit="" />
                      <StructMember Symbol="Sand" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1996.1.1 - Method" ESA_ID="EC_1996_1_1.Method" Unit="" Type="Bool">
                    <StructMembers>
                      <StructMember Symbol="I" Type="Bool" Unit="" />
                      <StructMember Symbol="II" Type="Bool" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1996.1.1 - K↓E←" ESA_ID="EC_1996_1_1.K_E" Unit="" Type="Numeric" />
                  <PropertySet Symbol="EC 1996.1.1 - Coef" ESA_ID="EC_1996_1_1.Coef" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="ϕ_unlim" Type="Numeric" Unit="" />
                      <StructMember Symbol="shrinkage" Type="Numeric" Unit="mm/m" />
                      <StructMember Symbol="α_t" Type="Numeric" Unit="10↑-6←/K" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1996.1.1 - t↓min←" ESA_ID="EC_1996_1_1.t_min" Unit="mm" Type="Numeric">
                    <StructMembers>
                      <StructMember Symbol="t_min_struct" Type="Numeric" Unit="mm" />
                      <StructMember Symbol="t_min_ret" Type="Numeric" Unit="mm" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1996.1.2 - Name" ESA_ID="EC_1996_1_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1996.2 - Name" ESA_ID="EC_1996_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1996.3 - Name" ESA_ID="EC_1996_3.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1997.1 - Name" ESA_ID="EC_1997_1.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1997.1 - γ↓F←" ESA_ID="EC_1997_1.EQU.γF" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="γ↓G,dst←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓G,stb←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓Q,dst←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓Q,stb←" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1997.1 - γ↓M←" ESA_ID="EC_1997_1.EQU.γM" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="γ↓ϕ'←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓c'←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓cu←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓qu←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓γ←" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1997.1 - γ↓F←" ESA_ID="EC_1997_1.STRGEO.γF" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="γ↓G,dst,A1←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓G,stb,A1←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓Q,dst,A1←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓Q,stb,A1←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓G,dst,A2←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓G,stb,A2←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓Q,dst,A2←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓Q,stb,A2←" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1997.1 - γ↓M←" ESA_ID="EC_1997_1.STRGEO.γM" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="γ↓ϕ',M1←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓c',M1←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓cu,M1←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓qu,M1←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓γ,M1←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓ϕ',M2←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓c',M2←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓cu,M2←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓qu,M2←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓γ,M2←" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1997.1 - γ↓R←" ESA_ID="EC_1997_1.STRGEO.γR" Unit="" Type="Struct">
                    <StructMembers>
                      <StructMember Symbol="γ↓R,v,R1←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓R,h,R1←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓R,v,R2←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓R,h,R2←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓R,v,R3←" Type="Numeric" Unit="" />
                      <StructMember Symbol="γ↓R,h,R3←" Type="Numeric" Unit="" />
                    </StructMembers>
                  </PropertySet>
                  <PropertySet Symbol="EC 1997.2 - Name" ESA_ID="EC_1997_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1998.1 - Name" ESA_ID="EC_1998_1.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1998.2 - Name" ESA_ID="EC_1998_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1998.3 - Name" ESA_ID="EC_1998_3.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1998.4 - Name" ESA_ID="EC_1998_4.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1998.5 - Name" ESA_ID="EC_1998_5.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1998.6 - Name" ESA_ID="EC_1998_6.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1999.1.1 - Name" ESA_ID="EC_1999_1_1.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1999.1.2 - Name" ESA_ID="EC_1999_1_2.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1999.1.3 - Name" ESA_ID="EC_1999_1_3.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1999.1.4 - Name" ESA_ID="EC_1999_1_4.Name" Unit="" Type="String" />
                  <PropertySet Symbol="EC 1999.1.5 - Name" ESA_ID="EC_1999_1_5.Name" Unit="" Type="String" />
                </Header>
                <Items>
                  <Item>
                    <P>Eurocode NA</P>
                    <P>Standard EN</P>
                    <P>STD</P>
                    <P>0</P>
                    <P>EC EN 1990</P>
                    <P>EC EN 1991-1-1</P>
                    <P>EC EN 1991-1-2</P>
                    <P>EC EN 1991-1-3</P>
                    <P>0</P>
                    <P>NaN</P>
                    <P>True;2;</P>
                    <P>NaN</P>
                    <P>NaN</P>
                    <P>1.0</P>
                    <P>NaN</P>
                    <P>True</P>
                    <P>1.6</P>
                    <P>2.0</P>
                    <P>NaN</P>
                    <P>0.8;4;5;15;</P>
                    <P>True</P>
                    <P>True</P>
                    <P>True</P>
                    <P>NaN</P>
                    <P>EC EN 1991-1-4</P>
                    <P>NaN</P>
                    <P>NaN</P>
                    <P>1</P>
                    <P>1</P>
                    <P>0.2;0.5;</P>
                    <P>False</P>
                    <P>NaN</P>
                    <P>True;1;</P>
                    <P>True</P>
                    <P>True</P>
                    <P>1</P>
                    <P>NaN</P>
                    <P>1.25</P>
                    <P>False</P>
                    <P>True</P>
                    <P>NaN</P>
                    <P>EC EN 1991-1-5</P>
                    <P>EC EN 1991-1-6</P>
                    <P>EC EN 1991-1-7</P>
                    <P>EC EN 1991-2</P>
                    <P>EC EN 1991-3</P>
                    <P>EC EN 1991-4</P>
                    <P>EC EN 1992-1-1</P>
                    <P>1</P>
                    <P>1</P>
                    <P>1.3</P>
                    <P>1.2</P>
                    <P>1.5;1.15;1.15;1.2;1.0;1.0;</P>
                    <P>1;1;</P>
                    <P>90</P>
                    <P>0.85</P>
                    <P>1</P>
                    <P>1</P>
                    <P>600</P>
                    <P>0.9</P>
                    <P>1.1</P>
                    <P>0.9;0.02;0.9;</P>
                    <P>1.5;2.5;</P>
                    <P>0</P>
                    <P>0</P>
                    <P>0</P>
                    <P>5;10;15;</P>
                    <P>10</P>
                    <P>0;5;10;</P>
                    <P>40;75;5;</P>
                    <P>0.005</P>
                    <P>0.44;NaN;0.54;NaN;0.7;0.8;</P>
                    <P>NaN</P>
                    <P>1.2</P>
                    <P>0.8;0.9;</P>
                    <P>0.95</P>
                    <P>50;30;</P>
                    <P>0.7</P>
                    <P>0.75;0.85;</P>
                    <P>1.05;0.95;1.1;0.9;1;1;</P>
                    <P>NaN;NaN;0.15;</P>
                    <P>NaN</P>
                    <P>0.380482;0.785398;</P>
                    <P>NaN;NaN;</P>
                    <P>26.5;45;38.6;45;</P>
                    <P>0.4</P>
                    <P>1.15;1.4;1.5;</P>
                    <P>NaN;NaN;0.1;</P>
                    <P>NaN</P>
                    <P>NaN</P>
                    <P>1;0.85;</P>
                    <P>0.6</P>
                    <P>0.45</P>
                    <P>0.8;1;0.75;</P>
                    <P>0.4;0.3;0.3;0.2;0.2;NaN;</P>
                    <P>3.4;0.425;</P>
                    <P>1;5;</P>
                    <P>NaN</P>
                    <P>NaN</P>
                    <P>32</P>
                    <P>NaN</P>
                    <P>NaN</P>
                    <P>0.15</P>
                    <P>0.25</P>
                    <P>0.5</P>
                    <P>NaN</P>
                    <P>NaN</P>
                    <P>NaN</P>
                    <P>NaN</P>
                    <P>NaN</P>
                    <P>8</P>
                    <P>NaN</P>
                    <P>NaN</P>
                    <P>NaN</P>
                    <P>NaN</P>
                    <P>NaN</P>
                    <P>NaN</P>
                    <P>8</P>
                    <P>8</P>
                    <P>8</P>
                    <P>10</P>
                    <P>5;8;</P>
                    <P>600;NaN;</P>
                    <P>0.8;0.8;</P>
                    <P>1.5</P>
                    <P>0.25</P>
                    <P>0.5</P>
                    <P>EC EN 1992-1-2</P>
                    <P>EC EN 1992-2</P>
                    <P>EC EN 1992-3</P>
                    <P>EC EN 1993-1-1</P>
                    <P>NaN;NaN;</P>
                    <P>1;1;1.25;</P>
                    <P>EC EN 1993-1-2</P>
                    <P>EC EN 1993-1-3</P>
                    <P>EC EN 1993-1-4</P>
                    <P>EC EN 1993-1-5</P>
                    <P>1.20;1.00;</P>
                    <P>EC EN 1993-1-6</P>
                    <P>EC EN 1993-1-7</P>
                    <P>EC EN 1993-1-8</P>
                    <P>1.25;1.25;1.1;1.0;1.0;1.0;1.1;</P>
                    <P>EC EN 1993-1-9</P>
                    <P>EC EN 1993-1-10</P>
                    <P>EC EN 1993-1-11</P>
                    <P>EC EN 1993-1-12</P>
                    <P>EC EN 1993-2</P>
                    <P>1.0;1.1;1.25;1.25;1.1;1.1;1.1;1.0;1.1;</P>
                    <P>EC EN 1993-3-1</P>
                    <P>EC EN 1993-3-2</P>
                    <P>EC EN 1993-4-1</P>
                    <P>EC EN 1993-4-2</P>
                    <P>EC EN 1993-4-3</P>
                    <P>EC EN 1993-5</P>
                    <P>EC EN 1993-6</P>
                    <P>EC EN 1994-1-1</P>
                    <P>1;1;</P>
                    <P>1.25</P>
                    <P>1.25</P>
                    <P>1</P>
                    <P>0.000325;0.000500;0.000200;0.000300;</P>
                    <P>0.70</P>
                    <P>NaN</P>
                    <P>1.25;1.25;</P>
                    <P>NaN</P>
                    <P>NaN</P>
                    <P>1.0</P>
                    <P>1.0</P>
                    <P>0.6</P>
                    <P>180</P>
                    <P>1.25</P>
                    <P>1.25</P>
                    <P>0.5</P>
                    <P>1.25</P>
                    <P>1.25</P>
                    <P>EC EN 1994-1-2</P>
                    <P>EC EN 1994-2</P>
                    <P>EC EN 1995-1-1</P>
                    <P>NaN</P>
                    <P>0.67;0.67;1.0;</P>
                    <P>EC EN 1995-1-2</P>
                    <P>EC EN 1995-2</P>
                    <P>EC EN 1996-1-1</P>
                    <P>NaN</P>
                    <P>1</P>
                    <P>NaN</P>
                    <P>True</P>
                    <P>1000</P>
                    <P>NaN;NaN;NaN;</P>
                    <P>NaN</P>
                    <P>EC EN 1996-1-2</P>
                    <P>EC EN 1996-2</P>
                    <P>EC EN 1996-3</P>
                    <P>EC EN 1997-1</P>
                    <P>1.1;0.9;1.5;0;</P>
                    <P>1.25;1.25;1.4;1.4;1.0;</P>
                    <P>1.35;1;1.5;0;1;1;1.3;0;</P>
                    <P>1;1;1;1;1;1.25;1.25;1.4;1.4;1;</P>
                    <P>1;1;1.4;1.1;1;1;</P>
                    <P>EC EN 1997-2</P>
                    <P>EC EN 1998-1</P>
                    <P>EC EN 1998-2</P>
                    <P>EC EN 1998-3</P>
                    <P>EC EN 1998-4</P>
                    <P>EC EN 1998-5</P>
                    <P>EC EN 1998-6</P>
                    <P>EC EN 1999-1-1</P>
                    <P>EC EN 1999-1-2</P>
                    <P>EC EN 1999-1-3</P>
                    <P>EC EN 1999-1-4</P>
                    <P>EC EN 1999-1-5</P>
                  </Item>
                </Items>
              </Data>
            </TCustomLibrary>
          </TGroupBox>
        </TPanel>
      </TPanel>
    </Main>
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="BLOCK_INI400_000134">
      <ENU>"National Annex parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005854">
      <ENU>"Reinforcement parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005856">
      <ENU>"Loading"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005890">
      <ENU>"Distance of the neutral axis"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005891">
      <ENU>"Reinforcement design:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005892">
      <ENU>"Tension reinforcement ≥ A↓sy1req ←"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005893">
      <ENU>"Compression reinforcement ≥ A↓sy2req ←"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_008058">
      <ENU>"No input: "</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_008059">
      <ENU>"Detailed calculation of extreme combination:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000026">
      <ENU>"Design of longitudinal reinforcement of rectangular cross section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000046">
      <ENU>DESCRIPTION("f↓yd←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000052">
      <ENU>"Required tension reinf. area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000105">
      <ENU>"Limit distances and comparison"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000144">
      <ENU>DESCRIPTION("ε↓yd←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000158">
      <ENU>"f↓yk← is bigger than maximum allowed f↓yk← by national annex"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000160">
      <ENU>"Lever arm of internal forces:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000193">
      <ENU>"Concrete area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000337">
      <ENU>"Tension area:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000341">
      <ENU>"x ≥ x↓bal1←=&gt;" &amp; x &amp; " m ≥ " &amp; x↓bal1← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000348">
      <ENU>"0 &lt; x &lt; x↓bal1 ←=&gt; 0 &lt; " &amp; x &amp; " &lt; " &amp; x↓bal1←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000363">
      <ENU>"ε↓u← = 1000000 %"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000364">
      <ENU>"Maximum reinforcement compressive strain"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000378">
      <ENU>DESCRIPTION("M↓Edy←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000379">
      <ENU>DESCRIPTION("N↓Ed←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000380">
      <ENU>"Remark: Positive value is tension, negative value is compression"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000383">
      <ENU>"=&gt; The case with prevailing tension"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000385">
      <ENU>"Tension area:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000386">
      <ENU>"Required tension reinf. area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000392">
      <ENU>"Area V, assumption: concrete does not act."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000393">
      <ENU>"x ≤ 0 =&gt;" &amp; x &amp; " ≤ 0"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000394">
      <ENU>"Required compression reinf. area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000395">
      <ENU>"Compression area:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000398">
      <ENU>"Tension area:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000399">
      <ENU>"Required compression reinf. area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000400">
      <ENU>"Compression area:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000401">
      <ENU>"Required tension reinf. area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000405">
      <ENU>"Required compression reinf. area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000406">
      <ENU>"Compression area:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000407">
      <ENU>"Area II, tension reinforcement is not needed"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000408">
      <ENU>"x↓bal1←&lt; x &lt; h/λ =&gt; " &amp; x↓bal1← &amp; " &lt; " &amp; x &amp; "&lt;" &amp; i</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000418">
      <ENU>"Required compression reinf. area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000419">
      <ENU>"Compression area:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000420">
      <ENU>"Required tension reinf. area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000421">
      <ENU>"Tension area:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000422">
      <ENU>"In this case must be M↓Edy2← ≥ M↓Edmin←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000423">
      <ENU>"Area IV, assumption: the whole cross section is compressed"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000424">
      <ENU>"Check the kind of breach - tensile or compressive"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000430">
      <ENU>"|N↓Ed←| ≤ N↓c,bal← =&gt; " &amp; VAL(ABS(N↓Ed←/10↑3←), 1) &amp; " kN ≤ " &amp; N↓c,bal←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000439">
      <ENU>"Area I"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000440">
      <ENU>"Area III, the design of compression reinforcement is not needed"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000441">
      <ENU>"x  ≤ x↓bal1 ←,↓    ←x ≥ x↓bal2← =&gt;" &amp; x &amp; " ≤  " &amp; x↓bal1← &amp; " , " &amp; x &amp; " ≥ " &amp; x↓bal2←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000444">
      <ENU>"Area I"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000445">
      <ENU>"x ≥ h/λ =&gt; " &amp; x &amp; " ≥ " &amp; i</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000452">
      <ENU>DESCRIPTION("z↓2←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000454">
      <ENU>DESCRIPTION("z↓1←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000456">
      <ENU>"=&gt; The case with prevailing compression"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000457">
      <ENU>"|N↓Ed←| &gt; N↓c,bal← =&gt; " &amp; VAL(ABS(N↓Ed←/10↑3←), 1) &amp; " &gt; " &amp; N↓c,bal←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000459">
      <ENU>"Required reinforcement area on both sides"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000460">
      <ENU>"It is recommended to design symetric reinforcement in the IV area."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000463">
      <ENU>"Required tension reinf. area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000464">
      <ENU>"Tension area:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000465">
      <ENU>"Required compression reinf. area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000466">
      <ENU>"Compression area:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000468">
      <ENU>"M↓Edy← = " &amp; M↓Edy←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000470">
      <ENU>"N↓Ed← = " &amp; N↓Ed←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000473">
      <ENU>"Symetric reinforcement:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000476">
      <ENU>"Symetric reinforcement:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000477">
      <ENU>"Lever arm of internal forces (compr. reinf.)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000486">
      <ENU>"Axial force is positive =&gt; The case with prevailing tension"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000490">
      <ENU>"Φ↓1← = " &amp; Φ↓1←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000491">
      <ENU>"Lower and upper longitudinal reinf. diameter"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000492">
      <ENU>"Provided reinforcement:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000493">
      <ENU>"A↓sy1← ≥ A↓sy1req ←=&gt; A↓sy1← ≥ " &amp; A↓sy1req←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000510">
      <ENU>"A↓sy2← ≥ A↓sy2req ←=&gt; A↓sy2← ≥ " &amp; A↓sy2req←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000513">
      <ENU>"Φ↓2← = " &amp; Φ↓2←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000517">
      <ENU>"Equilibrium is not found!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000518">
      <ENU>"Equilibrium is not found!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000519">
      <ENU>"Equilibrium is not found!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000523">
      <ENU>"Concrete area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000530">
      <ENU>"Remark: Moment is considered always as positive value, tension on bottom edge"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000531">
      <ENU>"x↓bal2 ←&lt; x =&gt; " &amp; x↓bal2← &amp; " &lt; " &amp; x</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000537">
      <ENU>"The compression reinforcement will be designed to the minimum required reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000545">
      <ENU>"=&gt; unlimited value of reinforcement compressive strain is used in the calculation"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000566">
      <ENU>"The member is compressed, the simplified method is used for symetric reinforcement design"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000567">
      <ENU>"The symetric reinforcement is designed according to the bigger value of A↓sy1req ←and  A↓sy2req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000575">
      <ENU>"The area of the tension reinforcement is negative =&gt; reinforcement is not required"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000576">
      <ENU>"The area of the compression reinforcement is negative =&gt; reinforcement is not required"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000588">
      <ENU>"The tension reinforcement will be designed to the minimum required reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005851">
      <ENU>"f↓yk← &gt; f↓yk,max← =&gt; "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005852">
      <ENU>f↓yk← &amp; " &gt; " &amp; f↓yk,max←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005853">
      <ENU>"Calculation stopped!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005898">
      <ENU>"Whole cross section is in tension"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006295">
      <ENU>n↓1← &amp; " x ϕ" &amp; Φ↓1←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006297">
      <ENU>DESCRIPTION("f↓yk←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006358">
      <ENU>"Reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006359">
      <ENU>IO.REINF.EC.Item</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006368">
      <ENU>"f↓yk← = " &amp; f↓yk←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006369">
      <ENU>"Designed"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006370">
      <ENU>"Designed"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006371">
      <ENU>n↓1← &amp; " x ϕ" &amp; Φ↓1←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006372">
      <ENU>"Designed"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006373">
      <ENU>n↓2← &amp; " x ϕ" &amp; Φ↓2←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006374">
      <ENU>"Designed"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006375">
      <ENU>n↓2← &amp; " x ϕ" &amp; Φ↓2←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008031">
      <ENU>"Detailed calculation of extreme combination:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008036">
      <ENU>Headline</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008053">
      <ENU>"Detailed calculation of extreme combination:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008054">
      <ENU>"No combination of internal forces was set."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008055">
      <ENU>"Enter some combination(s) to the input table. Output will recalculate automatically."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008056">
      <ENU>"Detailed calculation of extreme combination:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008057">
      <ENU>"Error: "</ENU>
    </Item>
  </Texts>
</Root>