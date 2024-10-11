# Code Structure
## FetchDessertPkg
&emsp; This is a package that contains a basic module of FetchDessert app. It incorporates MVVM structure that separates the concernts for Views and business logic(Models, that is interfaced through ViewModels).</br>
&emsp; In theory one could extends this package with more submodules and use this package for different Views that fit versions of apps on different platforms.</br>
Moreover, one could build different versions of the app running on the same platform that have expanding features and functionalities. Different UI/UX developers can simultaneously builld differnt versions of views without the constant branch switching, copying and pasting.</br>
Additionally, one could write automated tests for the app without the need of simulating human interactions with the views and only test the functionalities exposed by the VMs.</br>
&emsp; The vm + service layer strucuture is written with mocking in mind and can be easily tested with different types of services. The services can be easily swapped out for different types of services that can be used for different versions of the app.</br>

### Models:
**DetailMealModel.swift**: This model is decoded into whenever users access a particular detail view. It is used to store the details of a meal that is displayed in the DetailMealView.swift</br>
**MealModel.swift**: This model is used to decode the JSON data from the API call to The Meal DB. It is the model for displaying previews of array of meals</br>

### VM:
**DessertViewModel.swift**: This ViewModel is used to fetch the data from the API call to The Meal DB at init. It is used to store and display an array of MealModels. More functions to modify the state of the models can be added here</br>
**DetailDessertViewModel.swift**: This ViewModel is to interact with DetailDessertView. It house a DetailDessertAPIService that can be used for downloading detail data of a meal. It is used to store and display a DetailMealModel</br
### Utilities:
**APIManager.swift**: This file has the common resusable api request code for downloading decodable data.</br>
**Constants.swift**: This file has the common resusable constants for the app.</br>

### Interfaces (Service Layers):
**DetailDessertAPIService.swift**: A file/ common type that is used to download the detail data of a meal. There is more than one type of concrete DetailDessertAPIService</br>
**DessertAPIService.swift**: A file / common type that is used to download the data of meals. There is more than one type of concrete DessertAPIService</br>

### Tests:
**FetchDessertPkgTests.swift**: Tests primarily used to build API fucntionalities, and test if network calls are normal. Can add automatic UI testing</br>

## FetchDessert

### Views:
**DessertView.swift**: the top level view for displaying DessertBlock(s)
**DessertBlock.swift**: the modular view for displaying columns of meal previews. 
**DetailDessertView.swift**: the view for displaying the details of a meal, including ingredients, measurements, and instructions</br>