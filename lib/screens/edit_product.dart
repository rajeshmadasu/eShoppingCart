import '../providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  static const routeName = "/editproductscreen";
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _form = GlobalKey<FormState>();

  final _priceFocusNode = FocusNode();
  final _desciptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();

  final _imageUrlController = TextEditingController();

  var _editedProduct =
      Product(id: '', title: '', description: '', price: 0, imageUrl: '');

  void _saveForm() {
    final isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    Provider.of<Products>(context, listen: false).addProduct(_editedProduct);

    Navigator.of(context).pop();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('png') &&
              !_imageUrlController.text.endsWith('jpg') &&
              !_imageUrlController.text.endsWith('jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _imageUrlFocusNode.addListener(_updateImageUrl);
  }

  @override
  void dispose() {
    super.dispose();
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _imageUrlFocusNode.dispose();
    _priceFocusNode.dispose();
    _desciptionFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: [
          IconButton(
              onPressed: () {
                _saveForm();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a value';
                    }
                  },
                  onSaved: (value) {
                    _editedProduct = Product(
                        title: value.toString(),
                        price: _editedProduct.price,
                        description: _editedProduct.description,
                        id: _editedProduct.id,
                        imageUrl: _editedProduct.imageUrl);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_desciptionFocusNode);
                  },
                  onSaved: (value) {
                    _editedProduct = Product(
                        title: _editedProduct.title,
                        price: double.parse(value.toString()),
                        description: _editedProduct.description,
                        id: _editedProduct.id,
                        imageUrl: _editedProduct.imageUrl);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a value';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }

                    if (double.parse(value) <= 0) {
                      return 'Please enter a number greater than zero';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  focusNode: _desciptionFocusNode,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description';
                    }
                    if (value.length < 10) {
                      return 'Should be at least 10 characters long.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedProduct = Product(
                        title: _editedProduct.title,
                        price: _editedProduct.price,
                        description: value.toString(),
                        id: _editedProduct.id,
                        imageUrl: _editedProduct.imageUrl);
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 8, right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: _imageUrlController.text.isEmpty
                          ? const Text('Enter the URL')
                          : FittedBox(
                              child: Image.network(
                                _imageUrlController.text,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Expanded(
                        child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      onFieldSubmitted: (_) => {_saveForm()},
                      onEditingComplete: () {
                        setState(() {});
                      },
                      focusNode: _imageUrlFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a image url';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            title: _editedProduct.title,
                            price: _editedProduct.price,
                            description: _editedProduct.description,
                            id: _editedProduct.id,
                            imageUrl: value!);
                      },
                    )),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
