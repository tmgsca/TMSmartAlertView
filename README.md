#TMSmartAlertView

A simple custom alertView component that uses Xib's to allow users to highly customize the alertView layout aswell as allowing them to handle click events.

# Usage

1. Import "TMSmartAlertView.h" on your view controller
2. Instantiate a TMSmartAlertView object as the examples below

######Simple one button alertView
<language obj-c>
```
TMSmartAlertView * alertView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	  alertView = [[TMSmartAlertView alloc] initWithTitle:@"Title" text:@"Alert content text" cancelButtonTitle:@"Cancel" cancelButtonSelector:@selector(cancelButtonClicked) xibName:@"CustomXibName" target:self];
	  
	  [alertView show];
}

- (void) cancelButtonClicked
{
  // Handle cancel button clicked event. This one dismisses the alertView.
  [alertView dismiss];
}
```
######Yes or No alertView
<language obj-c>
```
TMSmartAlertView * alertView;

- (void) viewDidLoad
{
    [super viewDidLoad];
	  
	  alertView = [[TMSmartAlertView alloc] initWithTitle:@"Title" text:@"Alert content text" cancelButtonTitle:@"No"       cancelButtonSelector:@selector(cancelButtonClicked) yesButtonTitle:@"Yes" yesButtonSelector:@selector(yesButtonClicked) xibName:@"CustomXibName" target:self];
	  
	  [alertView show];
}

- (void) cancelButtonClicked
{
  // Handle no/cancel button clicked event. This one dismisses the alertView.
  [alertView dismiss];
}

- (void) yesButtonClicked
{
  // Handle yes button clicked event. This one dismisses the alertView.
  [alertView dismiss];
}
```
# License

```TMSmartAlertView``` is licensed under the [MIT License](http://opensource.org/licenses/MIT). See ```LICENSE``` for details.

### Copyright © 2014 Thiago Magalhães.
