   M S B A M L   `   `   `  ����  FLibrary'    !FLibrary.View.Author.AuthorDelete   5      W SPresentationCore, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5         AuthorVM  � DataContext#  �   5       � 	Resources 5	        Stl_btn_delete �� 
TargetType # MaterialDesignFlatLightBgButton �� BasedOn �� Property �� Value �� Orientation  Stl_btn_cancel��%  &	       7  &	 {    7  �� 5
   
   " ��6'   8   .�5      ��  � ��$ Stretch=�6;   �� 5       � �� �#2c7be56+   �� 5       � �� �#2c7be56,   �� 5       � ��
 �����6+   �� 5       � ��$ 0 0 15 0q�6'   �� 5       � �� 5      �� 5      $ 
Horizontal=�6!   .+�5      �� $��Yes, delete it!��6$   5      5      5      �� 5   
   " ��6'   8   .�5      ��  � ��$ Stretch=�6;   �� 5       � �� �#DD33336+   �� 5       � �� �#DD33336,   �� 5       � ��
 �����6+   �� 5       � ��$ 0 0 15 0q�6'   �� 5       � �� 5      �� 5       $ 
Horizontal=�6!   .+�5!      �� $��10 0 0 0q�6$   $��Cancel��66   5"      5$      5%      5&      .��5'      � $	��400��6   $	��400��6    � RowDefinitions 5(   
   �� 5)      $��* �6   �� 5*      $
��0.7* �6   �� 5+      $
��0.7* �6   �� 5,      $
��0.7* �6   .+�5.   
   �� $��0,15,0,0q�5/      $��/View/Book/info.png��50      $��Center=�51      $��Center=�52      $	��200��53      �� 55   
   $��1��6   $��	0 20 0 20q�6"   $ 
Horizontal=�65   $��Center=�6N   .+�56      �� $��Are you sure?��6   $��30(�6-   $
��Bold"�6;   57      �� 58   
   $��2��6   $'��!You won't be able to revert this!��6!   $��20(�6J   $��Center=�6X   �� 59   
   $��3��6   $ 
Horizontal=�6"   $��Center=�6;   .+�5:      �� $��40��6   #��[ 6!   ��6I   �� *	DeleteCMD+�� 5;      $��40��6   $��5 0 5 0q�6!   #��[ 62   $��Cancel��6Z   ��6k   �� *	CancelCMD+5<      5=      5>      