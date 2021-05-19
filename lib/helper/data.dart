import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel.categoryName ='Business';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80'; // do this by view->ActiveEditor->Soft wrap
  category.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName ='Entertainment';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'; // do this by view->ActiveEditor->Soft wrap
  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName ='General';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1489533119213-66a5cd877091?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1051&q=80'; // do this by view->ActiveEditor->Soft wrap
  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName ='Health';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1526256262350-7da7584cf5eb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'; // do this by view->ActiveEditor->Soft wrap
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName ='Science';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1581091014534-898da33e356e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8c2NpZW5jZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'; // do this by view->ActiveEditor->Soft wrap
  category.add(categoryModel);

  //6
  categoryModel = new CategoryModel();
  categoryModel.categoryName ='Sports';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'; // do this by view->ActiveEditor->Soft wrap
  category.add(categoryModel);

  //7
  categoryModel = new CategoryModel();
  categoryModel.categoryName ='Technology';
  categoryModel.imageUrl = 'https://images.unsplash.com/photo-1518770660439-4636190af475?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'; // do this by view->ActiveEditor->Soft wrap
  category.add(categoryModel);


  return category;
}