   M S B A M L   `   `   `  ����C  ?FLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:FLibrary.View.BookFLibrary.View.Book  5      ;"clr-namespace:FLibrary.ValidationsFLibrary.Validations  5	      %    FLibrary.View.Member.MemberEdit   5      W SPresentationCore, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:FLibrary.View.Book     5      c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      .valid"clr-namespace:FLibrary.Validations  5	         MaterialDesignBody#���   5
      $��Regular"�5      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5         TextRenderingMode$
 Auto=�5        MaterialDesignFont#���  5        MemberVM � DataContext# �  5       � 	Resources 5       �� 
TargetType  Slt_btn_save " MaterialDesignPaperLightButton �� BasedOn �� Property �� Value �� Triggers	 ^� 
Conditions
 �� Binding �� ElementName �� Path �� Value��%u  &	       7  �� 5   
   " ��6   8   .�5      ��  � {�$ False��6*    5      ^� 5      	 5      �� 5      
 6$   �� $ tbx_name��$ (Validation.HasError)�	 False6h   �� 5      
 6$   �� $ 
tbx_gender��$ (Validation.HasError)�	 False6j   �� 5      
 6$   �� $ tbx_dob��$ (Validation.HasError)�	 False6g   �� 5      
 6$   �� $ 	tbx_phone��$ (Validation.HasError)�	 False6i   �� 5      
 6$   �� $ tbx_address��$ (Validation.HasError)�	 False6k   0�5      �� 5       � {�$
 True��66   5!      5#      5$      .��5%      � 
�������$��20q�6    � RowDefinitions 5&   
   �� 5'      $��* �6   �� 5(      $��* �6   �� 5)      $��* �6   �� 5*      $��* �6   �� 5+      $��* �6   �� 5,      $��* �6   �� 5-      $��* �6   .+�5/   
   �� $��0��6   $��17 7 7 7q�6"    �� Orientation$ 
Horizontal=�64   .+�50      �� $��0��6   $��Update Member ��6%   $��16(�6;   $��SemiBold"�6I   52      �� 53   
   -   5        $��tbx_name��53      $��1��6    ! MaterialDesignOutlinedTextBox#��[ 6/   $	��290��6f   $��15q�6u   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Name of Member��6�   $��14(�6�   .��6�   ��54      �� 55      $ SelectMember.Name�6    �� UpdateSourceTrigger$ PropertyChanged=�63    �� Mode$ TwoWay=�6Y    �� ValidationRules 56      .   (FLibrary.Validations.EmptyRuleValidation  57      ,  &System.Windows.Controls.ValidationRule   ValidatesOnTargetUpdated$
 True��64   59      .��5:      5;      �� 5<   
   -   5        $��
tbx_gender��5<      $��2��6   #��[ 61   $	��290��6h   $��15q�6w   $ Gender��6�   $��14(�6�   .��6�   ��5=      �� 5>      $ SelectMember.Gender�6   $ PropertyChanged=�65   $ TwoWay=�6[    5?        5@      $
 True��64   5B      .��5C      5D      (  "System.Windows.Controls.DatePicker  5E   
   -   5        $��tbx_dob��5E   "   $��3��6   $	��290��61   $��15q�6@   $ Date of Birth��6M   $��14(�6|      SelectedDate 6�   �� *	StartDate+5G      �� 5I   
   -   5        $��	tbx_phone��5I      $��4��6   #��[ 60   $	��290��6g   $��15q�6v   $ Phone��6�   $��14(�6�   .��6�   ��5J      �� 5K      $ SelectMember.Phone�6   $ PropertyChanged=�64   $ TwoWay=�6Z    5L        5M      $
 True��64   5O      .��5P      5Q      �� 5R   
   -   5        $��tbx_address��5R      $��5��6   #��[ 62   $	��290��6i   $��15q�6x   $ Address��6�   $��14(�6�   .��6�   ��5S      �� 5T      $ SelectMember.Address�6   $ PropertyChanged=�66   $ TwoWay=�6\    5U        5V      $
 True��64   5X      .��5Y      5Z      �� 5[   
   $��6��6   $ 
Horizontal=�6"   $��Right=�6;   $��5q�6W   .+�5\      �� -   5         ��Name$ 
btn_update��5\      #��[ 6)   $��Update��6O    �� 	IsDefault$
 True��6�   $��5q�6�   ��6`   �� $ 
btn_cancel��$ ActualWidth���6�   �� *	UpdateCMD+6�   �� 5]      -   5        $ 
btn_cancel��5]      $
��20 0q�6)   $��Cancel��67   #��[ 6H   ��6�   �� *	CancelCMD+5^      5_      5`      