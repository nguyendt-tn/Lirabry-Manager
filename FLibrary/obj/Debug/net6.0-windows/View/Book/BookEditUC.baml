   M S B A M L   `   `   `  ����C  ?FLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:FLibrary.View.BookFLibrary.View.Book  5      ;"clr-namespace:FLibrary.ValidationsFLibrary.Validations  5	      !    FLibrary.View.Book.BookEdit   5      W SPresentationCore, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:FLibrary.View.Book     5      c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      .valid"clr-namespace:FLibrary.Validations  5	         MaterialDesignBody#���   5
      $��Regular"�5      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5         TextRenderingMode$
 Auto=�5        MaterialDesignFont#���  5       
 BookVM � DataContext# �  5       � 	Resources 5       �� 
TargetType  Slt_btn_save  MaterialDesignFlatButton �� BasedOn �� Property �� Value �� Triggers	 ^� 
Conditions
 �� Binding �� ElementName �� Path �� Value��%�  &	       7  �� 5   
   " ��6   8   .�5      ��  � {�$ False��6*    5      ^� 5      	 5      �� 5      
 6$   �� $ 	tbx_title��$ (Validation.HasError)�	 False6i   �� 5      
 6$   �� $ tbx_quantity��$ (Validation.HasError)�	 False6l   �� 5      
 6$   �� $ 
cbc_author��$ (Validation.HasError)�	 False6j   �� 5      
 6$   �� $ cbc_category��$ (Validation.HasError)�	 False6l   �� 5      
 6$   �� $ 	tbx_state��$ (Validation.HasError)�	 False6i   �� 5      
 6$   �� $ tbx_imageUrl��$ (Validation.HasError)�	 False6l   0�5      �� 5        � {�$
 True��66   5"      5$      5%      .��5&      � 
�������$��20q�6    � RowDefinitions 5'   
   �� 5(      $��* �6   �� 5)      $��* �6   �� 5*      $��* �6   �� 5+      $��* �6   �� 5,      $��* �6   �� 5-      $��* �6   �� 5.      $��* �6   �� 5/      $��* �6   .+�51   
   �� $��0��6   $��17 7 7 7q�6"    �� Orientation$ 
Horizontal=�64   .+�52      �� $��0��6   $��Update Book ��6%   $��16(�69   $��SemiBold"�6G   53      �� 55   
   -   5        $��	tbx_title��55      $��1��6    ! MaterialDesignOutlinedTextBox#��[ 60   $	��290��6g   $��15q�6v   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Name of Book��6�   $��14(�6�   .��6�   ��56      �� 57      $ SelectBook.Title�6    �� UpdateSourceTrigger$ PropertyChanged=�62    �� Mode$ TwoWay=�6X    �� ValidationRules 58      .   (FLibrary.Validations.EmptyRuleValidation  59      ,  &System.Windows.Controls.ValidationRule   ValidatesOnTargetUpdated$
 True��64   5;      .��5<      5=      �� 5>   
   -   5        $��
cbc_author��5C      $	��290��5?      $��15q�6   $��2��5@      $ Choose Author��5A       " MaterialDesignOutlinedComboBox#��[ 5B       �� DisplayMemberPath$ 
AuthorName��5D       �� SelectedValuePath$ 
AuthorName��5E       �� SelectedValue 5F      �� $ SelectBook.Author���5G      �� $ Authors� �� SelectedItem 5H      �� 5I      $ SelectBook.Author�6   $ PropertyChanged=�63   $ TwoWay=�6Y    5J        5K      $
 True��64   5M      5O      �� 5Q   
   -   5        $��cbc_category��5V      $	��290��5R      $��15q�6   $��3��5S      $ Choose Category��5T      #��[ 5U      $ CategoryName��5W      $ CategoryName��5X       5Y      �� $ SelectBook.Category���5Z      �� $ 
Categories� 5[      �� 5\      $ SelectBook.Category�6   $ PropertyChanged=�65   $ TwoWay=�6[    5]        5^      $
 True��64   5`      5b      �� 5c   
   -   5        $��tbx_quantity��5c      $��4��6   #��[ 63   $	��290��6j   $��15q�6y   $ Quantity of Book��6�   $��14(�6�   .��6�   ��5d      �� 5e      $ SelectBook.Quantity�6   $ PropertyChanged=�65   $ TwoWay=�6[    5f        5g      $
 True��64   5i      .��5j      5k      �� 5l   
   -   5        $��	tbx_state��5l      $��5��6   #��[ 60   $	��290��6g   $��15q�6v   $ State of Book��6�   $��14(�6�   .��6�   ��5m      �� 5n      $ SelectBook.State�6   $ PropertyChanged=�62   $ TwoWay=�6X    5o        5p      $
 True��64   5r      .��5s      5t      �� 5u   
   -   5        $��tbx_imageUrl��5u      $��6��6   #��[ 63   $	��290��6j   $��15q�6y   $ ImageUrl of Book��6�   $��14(�6�   .��6�   ��5v      �� 5w      $ SelectBook.ImageUrl�6   $ PropertyChanged=�65   $ TwoWay=�6[    5x        5y      $
 True��64   5{      .��5|      5}      �� 5~   
   $��7��6   $ 
Horizontal=�6"   $��Right=�6;   $��5q�6W   .+�5      �� -   5         ��Name$ btn_save��5      #��[ 6'   $��Update��6Y    �� 	IsDefault$
 True��6�   ��6j   �� $ 
btn_cancel��$ ActualWidth���6�   �� *	UpdateCMD+6�   �� 5�      -   5        $ 
btn_cancel��5�      $	��5 0q�6)   $��Cancel��66   #��[ 6G   ��6y   �� *	CancelCMD+5�      5�      5�      