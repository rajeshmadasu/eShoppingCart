# eshopingcart


## Getting Started
eShoppingCartFlutter uses provider state management libraries 

- https://pub.dev/packages/provider

Consumer only rebuilds the widgets that are part of its builder, Provider.of() on the other hand triggers a complete re-build (i.e. re-runs build()) of this widget's widget tree.

What does Provider.of<SomeData>(context) NOT do?

	A) Provider.of<...> sets up a LISTENER to provided data, it does NOT provide data to other listeners itself.

What's a good example for local state which you would typically handle via a StatefulWidget instead of a provided object (i.e. instead of via the Provider package)?
	A)This is some state/ data that only matters to one (or a few) widgets. It certainly doesn't need to be managed globally.


