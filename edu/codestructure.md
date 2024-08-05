# Code Structure
## FetchDessertPkg
This is a package that contains a basic module of FetchDessert app. It incorporates MVVM structure that separates the concernts for Views and business logic(Models, that is interfaced through ViewModels).</br>
In theory one could extends this package with more submodules and use this package for different Views that fit versions of apps on different platforms.</br>
Moreover, one could build different versions of the app running on the same platform that have expanding features and functionalities. Different UI/UX developers can simultaneously builld differnt versions of views without the constant branch switching, copying and pasting.</br>
Additionally, one could write automated tests for the app without the need of simulating human interactions with the views and only test the functionalities exposed by the VMs.</br>

### Models:
**DetailMealModel.swift**: This model is decoded into whenever users access a particular detail view. It is used to store the details of a meal that is displayed in the DetailMealView.swift</br>
**MealModel.swift**: This model is used to decode the JSON data from the API call to The Meal DB. It is the model for displaying previews of array of meals</br>

### VM:
**DessertViewModel.swift**: This ViewModel is used to fetch the data from the API call to The Meal DB at init. It is used to store the array of meals. More functions to modify the state of the models can be added here</br>

### Interface:
**APIManager.swift**: This is the interface for the API call to The Meal DB. It is used to download MealModel and DetailMealModel and other data.</br>

### Tests:
**FetchDessertPkgTests.swift**: Tests primarily used to build API fucntionalities, and test if network calls are normal. Can add automatic UI testing</br>

## FetchDessert

### Views:
**DessertView.swift**: the top level view for displaying DessertBlock(s)
**DessertBlock.swift**: the view for displaying columns of meal previews
**DessertDetailView.swift**: the view for displaying the details of a meal, including ingredients, measurements, and instructions</br>