   M S B A M L   `   `   `  ����C  ?FLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:FLibrary.ValidationsFLibrary.Validations  5      ;"clr-namespace:FLibrary.Helper.BaseFLibrary.Helper.Base  6?   '    !FLibrary.View.Account.AccountEdit   5      W SPresentationCore, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      .valid"clr-namespace:FLibrary.Validations  5      /helper"clr-namespace:FLibrary.Helper.Base  6?      MaterialDesignBody#���   5      $��Regular"�5	      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5
         TextRenderingMode$
 Auto=�5        MaterialDesignFont#���  5        	AccountVM � DataContext# �  5       � 	Resources 5       �� 
TargetType  Slt_btn_save " MaterialDesignPaperLightButton �� BasedOn �� Property �� Value �� Triggers	 ^� 
Conditions
 �� Binding �� ElementName �� Path �� Value��%�  &	       7  �� 5   
   " ��6   8   .�5      ��  � {�$ False��6*    5      ^� 5      	 5      �� 5      
 6$   �� $ tbx_name��$ (Validation.HasError)�	 False6h   �� 5      
 6$   �� $ 	tbx_email��$ (Validation.HasError)�	 False6i   �� 5      
 6$   �� $ tbx_password��$ (Validation.HasError)�	 False6l   0�5      �� 5       � {�$
 True��66   5      5      5       .��5!      � 
�������$��20q�6    � RowDefinitions 5"   
   �� 5#      $��* �6   �� 5$      $��* �6   �� 5%      $��* �6   �� 5&      $��* �6   �� 5'      $��* �6   �� 5(      $��* �6   �� 5)      $��* �6   �� 5*      $��* �6   �� 5+      $��* �6   .+�5-   
   �� $��0��6   $��Update Account��6!   $��17 7 7 7q�67   $��16(�6I   $��SemiBold"�6W   �� 5.   
   -   5        $��tbx_name��5.      $��1��6    ! MaterialDesignOutlinedTextBox#��[ 6/   $	��290��6f   $��15q�6u   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Name of Account��6�   $��14(�6�   .��6�   ��5/      �� 50      $ SelectAccount.Name�6    �� UpdateSourceTrigger$ PropertyChanged=�64    �� Mode$ TwoWay=�6Z    �� ValidationRules 51      .   (FLibrary.Validations.EmptyRuleValidation  52      ,  &System.Windows.Controls.ValidationRule   ValidatesOnTargetUpdated$
 True��64   54      .��55      56      �� 58   
   -   5        $��	tbx_email��58      $��2��6   #��[ 60   $	��290��6g   $��15q�6v   $ Email of Account��6�   $��14(�6�   .��6�   ��59      �� 5:      $ SelectAccount.Email�6   $ PropertyChanged=�65   $ TwoWay=�6[    5;        5<      $
 True��64   5>      .��5?      5@      G� 5B   
   -   5         G�Name$ tbx_password��5B   #   $��3��6    % !MaterialDesignOutlinedPasswordBox#��[ 69   $��16(�6t   $��
17 7 17 20q�6�   $ Password��6�   )   #FLibrary.Helper.Base.PasswordHelper   Attach$
 True��6�      Password 5C      �� 5D      $ SelectAccount.Password�6   $ TwoWay=�68   $ PropertyChanged=�6F    5E        5F      $
 True��64   5H      5J      �� 5K   
   $��4��6   $��Update Password��6!   $��17 7 7 7q�68   $��16(�6J   $��SemiBold"�6X   G� 5L   
   -   5        $ tbx_password_new��5L   #   $��6��6   #��[ 6=   $��16(�6x   $��
17 7 17 20q�6�   $ New Password��6�   $
 True��6�    5M      �� 5N      $ NewPassword�6   $ TwoWay=�6-   $ PropertyChanged=�6;   5O      5Q      G� 5R   
   -   5        $ tbx_password_current��5R   #   $��5��6   #��[ 6A   $��16(�6|   $��
17 7 17 20q�6�   $ Current Password��6�   $
 True��6�    5S      �� 5T      $ CurrentPassword�6   $ TwoWay=�61   $ PropertyChanged=�6?   5U      5W      G� 5X   
   -   5        $ tbx_password_new_confirm��5X   #   $��7��6   #��[ 6E   $��16(�6�   $��
17 7 17 20q�6�   $ Confirm New Password��6�   $
 True��6�    5Y      �� 5Z      $ ConfirmNewPassword�6   $ TwoWay=�64   $ PropertyChanged=�6B   5[      5]      �� 5^   
   $��8��6    �� Orientation$ 
Horizontal=�6"   $��Right=�6;   $��5q�6W   .+�5_      �� -   5         ��Name$ 
btn_update��5_      #��[ 6)    � ToolTip$" MaterialDesignOutlinedButton��6O   $��Update��6v    �� 	IsDefault$
 True��6�   $��5q�6�   ��6�   �� $ 
btn_cancel��$ ActualWidth���6�   �� *	UpdateCMD+6�   �� 5`      -   5        $ 
btn_cancel��5`      $
��20 0q�6)   $��Cancel��67   #��[ 6H   ��6�   �� *	CancelCMD+5a      5b      5c      