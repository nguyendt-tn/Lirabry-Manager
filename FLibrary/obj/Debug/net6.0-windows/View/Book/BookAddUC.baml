   M S B A M L   `   `   `  ����C  ?FLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:FLibrary.ValidationsFLibrary.Validations  5           FLibrary.View.Book.BookAdd   5      W SPresentationCore, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      .valid"clr-namespace:FLibrary.Validations  5         MaterialDesignBody#���   5      $��Regular"�5	      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5
         TextRenderingMode$
 Auto=�5        MaterialDesignFont#���  5       
 BookVM � DataContext# �  5       � 	Resources 5       �� 
TargetType  Slt_btn_save " MaterialDesignPaperLightButton �� BasedOn �� Property �� Value �� Triggers	 ^� 
Conditions
 �� Binding �� ElementName �� Path �� Value��%�  &	       7  �� 5   
   " ��6   8   .�5      ��  � {�$ False��6*    5      ^� 5      	 5      �� 5      
 6$   �� $ 	tbx_title��$ (Validation.HasError)�	 False6i   �� 5      
 6$   �� $ tbx_quantity��$ (Validation.HasError)�	 False6l   �� 5      
 6$   �� $ 
cbc_author��$ (Validation.HasError)�	 False6j   �� 5      
 6$   �� $ cbc_category��$ (Validation.HasError)�	 False6l   �� 5      
 6$   �� $ 	tbx_state��$ (Validation.HasError)�	 False6i   �� 5      
 6$   �� $ tbx_imageUrl��$ (Validation.HasError)�	 False6l   0�5      �� 5       � {�$
 True��66   5       5"      5#      .��5$      � 
�������$��20q�6    � RowDefinitions 5%   
   �� 5&      $��* �6   �� 5'      $��* �6   �� 5(      $��* �6   �� 5)      $��* �6   �� 5*      $��* �6   �� 5+      $��* �6   �� 5,      $��* �6   �� 5-      $��* �6   .+�5/   
   �� $��0��6   $��Add New Book��6!   $��17 7 7 7q�65   $��16(�6G   $��SemiBold"�6U   �� 50   
   -   5        $��	tbx_title��50      $��1��6    ! MaterialDesignOutlinedTextBox#��[ 60   $	��290��6g   $��15q�6v   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Name of Book��6�   $��14(�6�   .��6�   ��51      �� 52      $ CurrentBook.Title�6    �� UpdateSourceTrigger$ PropertyChanged=�63    �� Mode$ TwoWay=�6Y    �� ValidationRules 53      .   (FLibrary.Validations.EmptyRuleValidation  54      ,  &System.Windows.Controls.ValidationRule   ValidatesOnTargetUpdated$
 True��64   56      .��57      58      �� 59   
   -   5        $��
cbc_author��5>      $	��290��5:      $��15q�6   $��2��5;      $ Choose Author��5<       " MaterialDesignOutlinedComboBox#��[ 5=       �� DisplayMemberPath$ 
AuthorName��5?       �� SelectedValuePath$ 
AuthorName��5@       �� SelectedValue 5A      �� $ CurrentBook.Author���5B      �� $ Authors� �� SelectedItem 5C      �� 5D      $ CurrentBook.Author�6   $ PropertyChanged=�64   $ TwoWay=�6Z    5E        5F      $
 True��64   5H      5J      �� 5L   
   -   5        $��cbc_category��5Q      $	��290��5M      $��15q�6   $��3��5N      $ Choose Category��5O      #��[ 5P      $ CategoryName��5R      $ CategoryName��5S       5T      �� $ CurrentBook.Category���5U      �� $ 
Categories� 5V      �� 5W      $ CurrentBook.Category�6   $ PropertyChanged=�66   $ TwoWay=�6\    5X        5Y      $
 True��64   5[      5]      �� 5^   
   -   5        $��tbx_quantity��5^      $��4��6   #��[ 63   $	��290��6j   $��15q�6y   $ Quantity of Book��6�   $��14(�6�   .��6�   ��5_      �� 5`      $ CurrentBook.Quantity�6   $ PropertyChanged=�66   $ TwoWay=�6\    5a        5b      $
 True��64   5d      .��5e      5f      �� 5g   
   -   5        $��	tbx_state��5g      $��5��6   #��[ 60   $	��290��6g   $��15q�6v   $ State of Book��6�   $��14(�6�   .��6�   ��5h      �� 5i      $ CurrentBook.State�6   $ PropertyChanged=�63   $ TwoWay=�6Y    5j        5k      $
 True��64   5m      .��5n      5o      �� 5p   
   -   5        $��tbx_imageUrl��5p      $��6��6   #��[ 63   $	��290��6j   $��15q�6y   $ ImageUrl of Book��6�   $��14(�6�   .��6�   ��5q      �� 5r      $ CurrentBook.ImageUrl�6   $ PropertyChanged=�66   $ TwoWay=�6\    5s        5t      $
 True��64   5v      .��5w      5x      �� 5y   
   $��7��6    �� Orientation$ 
Horizontal=�6"   $��Right=�6;   $��5q�6W   .+�5z      �� -   5         ��Name$ btn_save��5z      #��[ 6'   $
��Save��6M    �� 	IsDefault$
 True��6�   $��5q�6�   ��6\   �� $ 
btn_cancel��$ ActualWidth���6�   �� *	SaveCMD+6�   �� 5{      -   5        $ 
btn_cancel��5{      $
��20 0q�6)   $��Cancel��67   #��[ 6H   ��6�   �� *	CancelCMD+5|      5}      5~      