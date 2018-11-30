UICollectionViewCell Height Bug
=========================

This demo project demonstrates the UICollectionViewCell's bug when the height of the 1st cell in 1st section is 0.0.
The bug occurs with the following setup:
* the UICollectionsView has 2 sections
* The 1st section has one row
* The 1st row has a height of 0.0

## Actual result
* The cells (in bounds) are NOT visible, but the collectionView can be scrolled, looks like that the cells are hidden

## Expected Result
* All cells with a height > 0 should be visible.


## Example
* Download demo project
* Toggle the schemes ShowBug, UseWorkaround
![Demo Image](https://raw.githubusercontent.com/tapwork/UICollectionViewHeightBug/master/demo.png)

## Possible Workaround              
Give the 1st section's row a minimum height of 0.1f

* I filed a bug report: rdar://18120029


