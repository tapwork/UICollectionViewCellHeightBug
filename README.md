UICollectionView Height Bug
=========================

This demo project demonstrates the UICollectionView's height bug when returning a zero height for the 1st sections 1st row 

There is an UICollectionView bug with the following setup
* the UICollectionsView has 2 sections
* The 1st section has one row
* This row has a zero height
* Result => the following visible UICollectionView cells are NOT visible, but the collectionView can be scrolled, looks like that they are hidden

## Possible Workaround              
Give the 1st sections row a minimum height of 0.1f
