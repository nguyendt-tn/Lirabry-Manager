   M S B A M L   `   `   `  ����  FLibrary    FLibrary.MainWindow   5   	   W SPresentationCore, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	   _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   -   5        $��
mainWindow��5         MaterialDesignBody#���   5   	   $��Regular"�5	      $��13(�5
      &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5         TextRenderingMode$
 Auto=�5        MaterialDesignFont#���  5      
������  � WindowStyle$
 None=�5       � 
ResizeMode$ NoResize=�6-    � AllowsTransparency$
 True��6C    
 MainVM � DataContext# [ 5   	    � Title$ 
MainWindow��5   	   $	��750��6   $
��1300��6)    � WindowStartupLocation$ CenterScreen=�66    � WindowState 6[   �� *WindowState+.  (System.Windows.Interactivity.Interaction	   Triggers	 5      /  )System.Windows.Interactivity.EventTrigger  5   
   
   	EventName$
 Loaded��6   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *LoadedWindowCMD+   CommandParameter 5   $   ��  �� ElementName$ 
mainWindow��5      .��5      ?  9MaterialDesignThemes.Wpf.Transitions.TransitioningContent  C  =MaterialDesignThemes.Wpf.Transitions.TransitioningContentBase   OpeningEffects 5   
   ;  5MaterialDesignThemes.Wpf.Transitions.TransitionEffect  5         Kind$ ExpandIn=�6.      Duration$ 0:0:0.8h�6>     5      $ SlideInFromBottom=�6.   .��5   
   ��  �� CornerRadius$ 10��6   ���#07074c���#07074c$��1q�6N   ._�5      )	  #MaterialDesignThemes.Wpf.DialogHost	   	  
Identifier$ 
MainDialog��6(    	  CloseOnClickAway$
 True��6@   .��5       �  � RowDefinitions 5!      �� 5"      $��0* �6(   �� 5#       � ColumnDefinitions 5%      �� 5&      $	��.2* �6+   �� 5'      $��* �6+   .+�5)      �� $��Library Management��6    $	��Top=�6:   $��Center=�6R   ���#7c27ef$��20(�6�   $��Black"�6�   $��0,27,0,0q�6�   $��2��6�   �� 5,      ���#07074c���#04293A$��1 0 0 0q�6H   $��1��6b   $ 	0 10 10 0��6r   $��2��6�   ._�5-      �  5.      �� 5/   "   $
��Auto �60   �� 50   "   $��* �60   .+�54      �� $��0��6)    �� Orientation$ 
Horizontal=�66   $��Right=�6O   $	��Top=�6k   .+�55   "   �� -   5         ��Name$ btn_MinimizedWindow��55   )     MaterialDesignFlatButton#��[ 6F   
���������56   !   0
  *MaterialDesignThemes.Wpf.PackIconExtension
   
  Kind$ WindowMinimize=���6l   �� *MinimizedWindowCMD+�� 57   "   -   5        $ btn_ShutDownApp��57   )   +  %MaterialDesignThemes.Wpf.ButtonAssist   CornerRadius$ 0 25 0 0��6B   #��[ 6v   
���  ����58   !   
  $ Close=���6a   �� *CloseWindowCMD+59      �� 5=      $��1��6-   ��6:   �� *ViewCurrent+5?      5@      � 5C      $��0��6   $��Center=�6+   $��2��6F   $��
0,0,1083,0q�6Z   $��1��6n   .+�5D      �  5E      �� 5F   "   $
��Auto �60   �� 5G   "   $��* �60   .+�5I      �� $��1��6&   $��0 49 0 0q�63   ��6E   �� *ListItemNavigate+ �� SelectedItem 6n   �� *SelectedView+��5J   "   �� 5K   &    �� 
TargetType" ��6,     MaterialDesignListBoxItem �� BasedOn# [ 6E   .�5L   *   ��  �� Property � �� �� Value$	 0 9q�6D   �� 5M   *    � ��$ Stretch=�6W   �� 5N   *    � ��$ Stretch=�6U     �� Triggers  5O   *   P� 5P   .   ! P� Property! �@J�IsMouseOver" P� Value$
" True��6M   . �5Q   2   ��  � �� �#34364F6O   5R   /   P� 5S   .   ! �@��
IsSelected$
" True��6L   . �5T   2   ��  � �� �#34364F6O   5U   /   5W   '   ��5Y   "   �� 5Z   &   .R�5[   *   � $��39��6/   ��5\   .   �� 5]   2   " �68   .�5^   6   ��  �@J�Opacity$	 0.6Q�6P     5_   6   �� 5`   :   # �� Binding# 6F   �� *
IsSelected+$ �� Value$ True6e   % N� EnterActions% 5a   >   �� 5b   B   .��5c   F   �� & �� TargetProperty$& Opacity�6Q   .��5d   J   W� ' g� Duration$' 0:0:0.3D�6Z   	( W� To( 16m   5e   G   5f   C   ) N� ExitActions) 5h   >   �� 5i   B   .��5j   F   �� $& Opacity�6Q   .��5k   J   W� $' 0:0:0.3D�6Z   ( 0.66m   5l   G   5m   C   5o   ;   5q   3    5s   .   �� 5t   2   $��5 �6C   �� 5u   2   $	��.8* �6C   �� 5v   2   $��* �6C   .+�5x   .   �� $��0��65   $
��0 -5q�6E   
�������$ 0 7 7 0��6f   y�6}   �� *
IsSelected+   BooleanToVisibilityConverter* �� 	Converter#* [ '  !MaterialDesignThemes.Wpf.PackIcon  5y   .   $��1��6F   $	��0 3q�6V   $
��Auto��6y   $
��Auto��6�   ���#7c27ef$��Center=�6�   $��Center=�6�   +   Kind+ 6c   �� *Icon+6�   �� 5z   .   $��2��68   $��0 0 0 0q�6H   $��Center=�6v   $
��Left=�6�   ���#7c27ef$��14(�6�   $��SemiBold"�6�   ��6Y   �� *DisplayName+6�   5{   +   5|   '   5~      5      5�      �� 5�      $	��Top=�6!   $��Center=�69   ���#7c27ef$��20(�6k   $��
0,98,100,0q�6y   $��2��6�   $
��Wrap=�6�   $	��Hi!��6�   �� 5�      $	��Top=�6!   $��Center=�69   ���#7c27ef$��20(�6k   $��0,98,0,0q�6y   $��2��6�   $
��Wrap=�6�   ��6�   �� *
UserName+�� 5�      , � ToolTip$
, Icon��6W   $
��Left=�6f   $��
50,700,0,0q�6�   $��2��6�   $	��Top=�6�    " MaterialDesignRaisedDarkButton#��[ 6�   ��6   
  *ArrowRightBoldOutline+��6�   �� *	LogoutCMD+��6  �� $ 
mainWindow��5�      5�      5�      5�      5�      