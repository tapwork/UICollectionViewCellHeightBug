UICollectionViewCell Height Bug
=========================

This demo project demonstrates the UICollectionViewCell's height bug when the dataSource (controller) returns a zero height for the 1st sections 1st row cell.
The bug occurs with the following setup:
* the UICollectionsView has 2 sections
* The 1st section has one row
* This row has a zero height for the cell
* Result => the following UICollectionView cells (in bounds) are NOT visible, but the collectionView can be scrolled, looks like that the cells are hidden
* I filed a bug report: rdar://18120029

## Example
![Demo Image](https://raw.githubusercontent.com/tapwork/UICollectionViewHeightBug/master/demo.png)

## Possible Workaround              
Give the 1st section's row a minimum height of 0.1f


## How to the see the bug in action?
* Download demo project
* Toggle the schemes BUG_OFF, BUG_ON, BUG_Workaround

