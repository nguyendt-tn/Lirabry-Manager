   M S B A M L   `   `   `  ����C  ?FLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:FLibrary.View.BookFLibrary.View.Book  5      ;"clr-namespace:FLibrary.ValidationsFLibrary.Validations  5	      $    FLibrary.View.Member.MemberAdd   5      W SPresentationCore, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:FLibrary.View.Book     5      c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      .valid"clr-namespace:FLibrary.Validations  5	         MaterialDesignBody#���   5
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
   �� $��0��6   $��Add New Member��6!   $��17 7 7 7q�67   $��16(�6I   $��SemiBold"�6W   �� 50   
   -   5        $��tbx_name��50      $��1��6    ! MaterialDesignOutlinedTextBox#��[ 6/   $	��290��6f   $��15q�6u   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Name of Member��6�   $��14(�6�   .��6�   ��51      �� 52      $ CurrentMember.Name�6    �� UpdateSourceTrigger$ PropertyChanged=�64    �� Mode$ TwoWay=�6Z    �� ValidationRules 53      .   (FLibrary.Validations.EmptyRuleValidation  54      ,  &System.Windows.Controls.ValidationRule   ValidatesOnTargetUpdated$
 True��64   56      .��57      58      �� 59   
   -   5        $��
tbx_gender��59      $��2��6   #��[ 61   $	��290��6h   $��15q�6w   $ Gender��6�   $��14(�6�   .��6�   ��5:      �� 5;      $ CurrentMember.Gender�6   $ PropertyChanged=�66   $ TwoWay=�6\    5<        5=      $
 True��64   5?      .��5@      5A      (  "System.Windows.Controls.DatePicker  5B   
   -   5        $��tbx_dob��5B   ]   $��3��6    $  MaterialDesignOutlinedDatePicker#��[ 6#   $	��290��6l   $��15q�6{   $ Date of Birth��6�   $��14(�6�      SelectedDate 6�   �� *	StartDate+ �� StringFormat$ 
dd-MM-yyyy��5D      �� 5F   
   -   5        $��	tbx_phone��5F      $��4��6   #��[ 60   $	��290��6g   $��15q�6v   $ Phone��6�   $��14(�6�   .��6�   ��5G      �� 5H      $ CurrentMember.Phone�6   $ PropertyChanged=�65   $ TwoWay=�6[    5I        5J      $
 True��64   5L      .��5M      5N      �� 5O   
   -   5        $��tbx_address��5O      $��5��6   #��[ 62   $	��290��6i   $��15q�6x   $ Address��6�   $��14(�6�   .��6�   ��5P      �� 5Q      $ CurrentMember.Address�6   $ PropertyChanged=�67   $ TwoWay=�6]    5R        5S      $
 True��64   5U      .��5V      5W      �� 5X   
   $��6��6    �� Orientation$ 
Horizontal=�6"   $��Right=�6;   $��5q�6W   .+�5Y      �� -   5         ��Name$ btn_save��5Y      #��[ 6'   $
��Save��6M    �� 	IsDefault$
 True��6�   $��5q�6�   ��6\   �� $ 
btn_cancel��$ ActualWidth���6�   �� *	SaveCMD+6�   �� 5Z      -   5        $ 
btn_cancel��5Z      $
��20 0q�6)   $��Cancel��67   #��[ 6H   ��6�   �� *	CancelCMD+5[      5\      5]      