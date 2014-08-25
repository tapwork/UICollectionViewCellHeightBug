UICollectionViewHeightBug
=========================

This demo project demonstrates the UICollectionView's height bug when returning a zero height for the 1st sections 1st row 

There is an UICollectionView bug with the following setup
1. the UICollectionsView has 2 sections
2. The 1st section has one row
3. This row has a zero height
4. Result => the following visible UICollectionView cells are NOT visible, but the collectionView can be scrolled, looks like that they are hidden

## Possible Workaround              
Give the 1st sections row a minimum height of 0.1f
