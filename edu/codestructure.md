# Code Structure
## FetchDessertPkg
&emsp; This is a package that contains a module of FetchDessert app. It incorporates MVVM structure that separates the concerns for Views and business logic(Models, that is interfaced through ViewModels).</br>
&emsp; In theory, one could extend this package with more submodules and use this package for different Views that fit versions of apps on different platforms.
Moreover, one could build different versions of the app running on the same platform that have expanding features and functionalities. Different UI/UX developers can simultaneously builld different versions of views without constantly resolving merge conflicts. Additionally, one could write automated tests for the app without the need for simulating human interactions with the views and only test the functionalities exposed by the VMs.</br>
&emsp; The **vm** + **service** layer strucuture is written with mocking in mind and can be easily tested with different types of services. Different (production/ development...)types of services can be used for different versions of the app, and services are now reusable. Currently service layer types are written with adapting different styles(Combine, Async/Await) of API services in mind. Such structure can  be used to deal with deprecating swift apis. 

### Models:
&emsp;**DetailMealModel.swift**: This model is decoded into whenever users access a particular detail view. It is used to store the details of a meal that is displayed in the DetailMealView.swift.</br>
&emsp;**MealModel.swift**: This model is used to decode MealModel data from the API call to The Meal DB. It is the model for displaying previews of array of meals.</br>

### VM:
&emsp;**DessertViewModel.swift**: This ViewModel is used to fetch the data from the API call to The Meal DB at init. It is used to store and display an array of MealModels. It houses a DessertAPIService.</br>
&emsp;**DetailDessertViewModel.swift**: This ViewModel is to interact with DetailDessertView. It house a DetailDessertAPIService that can be used for downloading detail data of a meal. It is used to store and display a DetailMealModel.</br>
### Utilities:
&emsp;**APIManager.swift**: This file has the common resusable api request code for downloading decodable data.</br>
&emsp;**Constants.swift**: This file has the common resusable constants for the app.</br>

### Interfaces (Service Layers):
&emsp;**DetailDessertAPIService.swift**: A file/ common type that is used for getting the detail data of a meal. There is more than one type of concrete DetailDessertAPIService</br>
&emsp;**DessertAPIService.swift**: A file / common type that is used for getting the data of meals. There is more than one type of concrete DessertAPIService</br>

### Tests:
&emsp;**FetchDessertPkgTests.swift**: Tests primarily used to build  fucntionalities, and test if network calls are normal. Can add automatic UI testing</br>

## FetchDessert

### Views:
&emsp;**DessertView.swift**: top level view for housing DessertCells (s)</br>
&emsp;**DessertCell.swift**: singluar view for displaying single mealModel. </br>
&emsp;**DetailDessertView.swift**: the view for displaying the details of a meal, including ingredients, measurements, and instructions.</br>