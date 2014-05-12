#TMSmartAlertView

A simple custom alertView component that uses Xib's to allow users to highly customize the alertView layout aswell as allowing them to handle click events.

# Usage

######1 - Import "TMSmartAlertView.h" on your view controller. <br/>
######2 - Instantiate a TMSmartAlertView object as the following example:

<language Objective-C>
```
//Simple one button alertView

TMSmartAlertView * alertView = [[TMSmartAlertView alloc] initWithTitle:@"Title" text:@"Alert content text" cancelButtonTitle:@"Cancel" cancelButtonSelector:@selector(cancelButtonClicked) xibName:@"CustomXibName" target:self];
```
<language Objective-C>
```
// Yes or No alertView

TMSmartAlertView * alertView = [[TMSmartAlertView alloc] initWithTitle:@"Title" text:@"Alert content text" cancelButtonTitle:@"No" cancelButtonSelector:@selector(cancelButtonClicked) yesButtonTitle:@"Yes" yesButtonSelector:@selector(yesButtonClicked) xibName:@"CustomXibName" target:self];
```
