   M S B A M L   `   `   `  ����  FLibrary%    FLibrary.View.Account.AccountUC   5      W SPresentationCore, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5         MaterialDesignBody#���   5      $��Regular"�5	      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5
         TextRenderingMode$
 Auto=�5        MaterialDesignFont#���  5        	AccountVM � DataContext# �  5       � 	Resources 5        Stl_btn_addnew �� 
TargetType # MaterialDesignFlatLightBgButton �� BasedOn �� Property �� Value �� Orientation'  !MaterialDesignThemes.Wpf.PackIcon	   Kind  Stl_btn_export  Stl_btn_edit  MaterialDesignFlatButton  Stl_btn_delete��%�  &	       7  &	 �    7  &	 M    7  &	 �    7  �� 5   
   " ��6'   8   .�5      ��  � ��$ Stretch=�6;   �� 5       � �� �#2c7be56+   �� 5       � �� �#2c7be56,   �� 5       � ��
 �����6+   �� 5       � ��$ 0 0 15 0q�6'   �� 5       � �� 5      �� 5      $ 
Horizontal=�6!   .+�5        $
	 Plus=�62   �� 5      $��10 0 0 0q�6$   $��ADD NEW��66   5      5      5      �� 5    
   " ��6'   8   .�5!      ��  � ��$ Stretch=�6;   �� 5"       � �� �#2c7be56+   �� 5#       � �� �#2c7be56,   �� 5$       � ��
 �����6+   �� 5%       � ��$ 0 0 15 0q�6'   �� 5&       � �� 5'      �� 5(      $ 
Horizontal=�6!   .+�5)        $	 Download=�62   �� 5*      $��10 0 0 0q�6$   $��EXPORT��66   5+      5-      5.      �� 5/   
   " ��6%   8   .�50      ��  � �� �#34364F6+   �� 51       � ��$ 5 0 5 0q�6(   52      �� 53   
   " ��6'   8   .�54      ��  � ��
 � E��6+   �� 55       � ��$ 5 0 5 0q�6(   �� 56       � ��$	 5 0q�6'   57      58      .��59      � $��10q�6   
 � RowDefinitions
 5:   
   �� 5;      $	��.1* �6   �� 5<      $��* �6   �� 5=      $
��Auto �6   .+�5@   
   � $��0��6    � ColumnDefinitions 5A      �� 5B      $
��Auto �6#   �� 5C      $��* �6#   �� 5D      $
��Auto �6#   �� 5E      $
��Auto �6#   .+�5H      �� $��0��6   $��Account��6(   $��Center=�67   $��10q�6R   $��18(�6^   
�������$��SemiBold"�6   �� 5I      $��2��6   #��[ 6%   ��6M   �� *AddNewAccountCMD+�� 5J      $��3��6   #��[ 6%   ��6M   �� *	ExportCMD+�� 5L      $��1��6   
�������$	��0.3q�68   $��
15 10 5 10q�6N   $	��397��6b   $	��397��6q   $
��Left=�6�    �� CornerRadius$ 3��6�   ._�5M      �  5N       	 PrimaryHueMidBrush �� Color��%/   &		       �� 5O      $ Transparent��6E   5P       5Q      �� 5R      $	��.2* �6+   �� 5S      $��* �6+   .+�5U      �� $
��Auto��6   $
��Auto��6*   #��[ 68   
���������6j   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ Search=�   Size 196�   �� 5V      $��1��6   $	��5 0q�6.    �� 
CaretBrush
 �����$��Center=�6�   $��16(�6�   
�������)  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Search��6�   
������ ��6<   �� *ContentSearch+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�.��6#  .  (System.Windows.Interactivity.Interaction   Triggers 5W      /  )System.Windows.Interactivity.EventTrigger  5X         	EventName$ TextChanged��6-   .  (System.Windows.Interactivity.TriggerBase   Actions. 5Y   "   6  0System.Windows.Interactivity.InvokeCommandAction     Command 68   �� *SearchAccountCMD+5Z      .��5[   2   5\      5]      5^      5_      �� 5b   
   $��1��6   $	��0.7q�6   $ 	0 0 15 15��64   ._�5c      �� ��6   �� *
Accounts+��5d      �� 5e      " ��6    
 MaterialDesignGridViewItem# [
 66   .�5f      ��  � ��$ Center=�6G   �� 5g       � ��$ Center=�6E   �� 5h       � ��$ 15(�65   �� 5i       � ��$ 0q�64    �� Triggers 5j      P� 5k       P� Property �@��
IsSelected P� Value$
 true��6<   . �5l   "   ��  � �� �#041C326?   �� 5m   "    � �� �#041C326?   5n      5p       �� View 5r      �� 5s      .P�5u      �� ��5v      �� 5w   "   $��
Account ID��6,   
�������$��SemiBold"�6Q   $��10 0 0 0q�6g    �� CellTemplate 5y      �� 5z   "   .R�5{   &   ��  ��Name$ id��60   ���#9a9cab��6<   �� *Id+6P   5|   #   5~      �� 5      ��5�      �� 5�   "   $��Account Name��6,   
�������$��SemiBold"�6S   $��10 0 0 0q�6i    5�      �� 5�   "   .R�5�   &   �� $
 name��60   ���#9a9cab��6>   �� *Name+6T   5�   #   5�      �� 5�      ��5�      �� 5�   "   $��Account Email��6,   
�������$��SemiBold"�6T   $��10 0 0 0q�6j    5�      �� 5�   "   .R�5�   &   �� $ email��60   ���#9a9cab��6?   �� *Email+6V   5�   #   5�      �� 5�      ��5�      �� 5�   "   $��Account Password��6,   
�������$��SemiBold"�6W   $��10 0 0 0q�6m    5�      �� 5�   "   .R�5�   &   �� $ password��60   $��******��6B   ���#9a9cab6P   5�   #   5�      �� 5�      ��5�      �� 5�   "   $��Action��6,   
�������$��SemiBold"�6M   $��10 0 0 0q�6c    5�      �� 5�   "   .R�5�   &   �� $ 
Horizontal=�61   .+�5�   *   �� #��[ 61   ��6W   ��  �� RelativeSource ��  �� AncestorType ListView  �� Path$   DataContext.EditAccountCMD���6�   �� .��5�   .     $
	 Edit=�6F   $��19��6R   $��19��6]   ���#ECB3656i   5�   +   �� 5�   *   #��[ 61   $��0��6Y   ��6g   ��  ��  ListView$"  DataContext.DeleteAccountCMD���6�   �� .��5�   .     $	 Delete=�6F   $��19��6T   $��19��6_   5�   +   5�   '   5�   #   5�      5�      5�      5�      5�      5�      