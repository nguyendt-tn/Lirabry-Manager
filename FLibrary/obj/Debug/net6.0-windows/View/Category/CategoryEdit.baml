   M S B A M L   `   `   `  ����C  ?FLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:FLibrary.ValidationsFLibrary.Validations  5      )    #FLibrary.View.Category.CategoryEdit   5      W SPresentationCore, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      .valid"clr-namespace:FLibrary.Validations  5         MaterialDesignBody#���   5      $��Regular"�5	      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5
         TextRenderingMode$
 Auto=�5        MaterialDesignFont#���  5        
CategoryVM � DataContext# �  5       � 	Resources 5       �� 
TargetType  Slt_btn_save " MaterialDesignPaperLightButton �� BasedOn �� Property �� Value �� Triggers	 ^� 
Conditions
 �� Binding �� ElementName �� Path �� Value��%  &	       7  �� 5   
   " ��6   8   .�5      ��  � {�$ False��6*    5      ^� 5      	 5      �� 5      
 6$   �� $ tbx_name��$ (Validation.HasError)�	 False6h   0�5      �� 5       � {�$
 True��66   5      5      5      .��5      � 
�������$��20q�6    � RowDefinitions 5    
   �� 5!      $��* �6   �� 5"      $��* �6   �� 5#      $��* �6   �� 5$      $��* �6   �� 5%      $��* �6   �� 5&      $��* �6   �� 5'      $��* �6   .+�5)   
   �� $��0��6   $��Update Category��6!   $��17 7 7 7q�68   $��16(�6J   $��SemiBold"�6X   �� 5*   
   -   5        $��tbx_name��5*      $��1��6    ! MaterialDesignOutlinedTextBox#��[ 6/   $	��290��6f   $��15q�6u   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Name of Category��6�   $��14(�6�   .��6�   ��5+      �� 5,      $! SelectCategory.CategoryName�6    �� UpdateSourceTrigger$ PropertyChanged=�6=    �� Mode$ TwoWay=�6c    �� ValidationRules 5-      .   (FLibrary.Validations.EmptyRuleValidation  5.      ,  &System.Windows.Controls.ValidationRule   ValidatesOnTargetUpdated$
 True��64   50      .��51      52      �� 53   
   $��6��6    �� Orientation$ 
Horizontal=�6"   $��Right=�6;   $��5q�6W   .+�54      �� -   5         ��Name$ 
btn_update��54      #��[ 6)   $��Update��6O    �� 	IsDefault$
 True��6�   $��5q�6�   ��6`   �� $ 
btn_cancel��$ ActualWidth���6�   �� *	UpdateCMD+6�   �� 55      -   5        $ 
btn_cancel��55      $
��20 0q�6)   $��Cancel��67   #��[ 6H   ��6�   �� *	CancelCMD+56      57      58      