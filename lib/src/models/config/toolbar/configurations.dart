import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/widgets.dart'
    show Axis, Color, Decoration, WrapAlignment, WrapCrossAlignment;
import '../../../widgets/embeds.dart';

import '../../structs/link_dialog_action.dart';
import '../../themes/quill_custom_button.dart';
import '../../themes/quill_dialog_theme.dart';
import '../../themes/quill_icon_theme.dart';
import 'buttons/base.dart';
import 'buttons/clear_format.dart';
import 'buttons/color.dart';
import 'buttons/font_family.dart';
import 'buttons/font_size.dart';
import 'buttons/history.dart';
import 'buttons/indent.dart';
import 'buttons/link_style.dart';
import 'buttons/search.dart';
import 'buttons/select_alignment.dart';
import 'buttons/select_header_style.dart';
import 'buttons/toggle_check_list.dart';
import 'buttons/toggle_style.dart';

export './../../../widgets/toolbar/buttons/search/search_dialog.dart';
export './buttons/base.dart';
export './buttons/clear_format.dart';
export './buttons/color.dart';
export './buttons/font_family.dart';
export './buttons/font_size.dart';
export './buttons/history.dart';
export './buttons/indent.dart';
export './buttons/link_style.dart';
export './buttons/search.dart';
export './buttons/select_alignment.dart';
export './buttons/select_header_style.dart';
export './buttons/toggle_check_list.dart';
export './buttons/toggle_style.dart';

/// The default size of the icon of a button.
const double kDefaultIconSize = 18;

/// The default size for the toolbar (width, height)
const double defaultToolbarSize = kDefaultIconSize * 2;

/// The factor of how much larger the button is in relation to the icon.
const double kIconButtonFactor = 1.77;

/// The horizontal margin between the contents of each toolbar section.
const double kToolbarSectionSpacing = 4;

/// The configurations for the toolbar widget of flutter quill
@immutable
class QuillToolbarConfigurations extends Equatable {
  const QuillToolbarConfigurations({
    this.toolbarSectionSpacing = kToolbarSectionSpacing,
    this.toolbarIconAlignment = WrapAlignment.center,
    this.toolbarIconCrossAlignment = WrapCrossAlignment.center,
    this.buttonOptions = const QuillToolbarButtonOptions(),
    this.multiRowsDisplay = true,
    this.fontFamilyValues,
    this.fontSizesValues,
    this.showDividers = true,
    this.showFontFamily = true,
    this.showFontSize = true,
    this.showBoldButton = true,
    this.showItalicButton = true,
    this.showSmallButton = false,
    this.showUnderLineButton = true,
    this.showStrikeThrough = true,
    this.showInlineCode = true,
    this.showColorButton = true,
    this.showBackgroundColorButton = true,
    this.showClearFormat = true,
    this.showAlignmentButtons = false,
    this.showLeftAlignment = true,
    this.showCenterAlignment = true,
    this.showRightAlignment = true,
    this.showJustifyAlignment = true,
    this.showHeaderStyle = true,
    this.showListNumbers = true,
    this.showListBullets = true,
    this.showListCheck = true,
    this.showCodeBlock = true,
    this.showQuote = true,
    this.showIndent = true,
    this.showLink = true,
    this.showUndo = true,
    this.showRedo = true,
    this.showDirection = false,
    this.showSearchButton = true,
    this.showSubscript = true,
    this.showSuperscript = true,
    this.customButtons = const [],

    /// The decoration to use for the toolbar.
    this.decoration,

    /// Toolbar items to display for controls of embed blocks
    this.embedButtons,
    this.linkDialogAction,

    ///The theme to use for the icons in the toolbar, uses type [QuillIconTheme]
    this.iconTheme,
    this.dialogTheme,
    this.axis = Axis.horizontal,
    this.color,
    this.sectionDividerColor,
    this.sectionDividerSpace,

    /// By default it will calculated based on the [globalIconSize] from
    /// [base] in [QuillToolbarButtonOptions]
    /// You can change it but the the change only apply if
    /// the [multiRowsDisplay] is false, if [multiRowsDisplay] then the value
    /// will be [kDefaultIconSize] * 2
    double? toolbarSize,
  }) : _toolbarSize = toolbarSize;

  final double? _toolbarSize;

  /// The toolbar size, by default it will be `baseButtonOptions.iconSize * 2`
  double get toolbarSize {
    final alternativeToolbarSize = _toolbarSize;
    if (alternativeToolbarSize != null) {
      return alternativeToolbarSize;
    }
    return buttonOptions.base.globalIconSize * 2;
  }

  /// If you want change spesefic buttons or all of them
  /// then you came to the right place
  final QuillToolbarButtonOptions buttonOptions;
  final bool multiRowsDisplay;

  /// By default it will be
  /// ```
  /// {
  ///   'Sans Serif': 'sans-serif',
  ///   'Serif': 'serif',
  ///   'Monospace': 'monospace',
  ///   'Ibarra Real Nova': 'ibarra-real-nova',
  ///   'SquarePeg': 'square-peg',
  ///   'Nunito': 'nunito',
  ///   'Pacifico': 'pacifico',
  ///   'Roboto Mono': 'roboto-mono',
  ///   'Clear'.i18n: 'Clear'
  /// };
  /// ```
  final Map<String, String>? fontFamilyValues;

  /// By default it will be
  /// ```
  /// {
  ///   'Small'.i18n: 'small',
  ///   'Large'.i18n: 'large',
  ///   'Huge'.i18n: 'huge',
  ///   'Clear'.i18n: '0'
  /// }
  /// ```
  final Map<String, String>? fontSizesValues;

  /// Toolbar axis
  /// it will apply only for [QuillToolbar.basic]
  /// we will update that logic soon
  final Axis axis;

  // Overrides the action in the _LinkDialog widget
  final LinkDialogAction? linkDialogAction;

  final double toolbarSectionSpacing;
  final WrapAlignment toolbarIconAlignment;
  final WrapCrossAlignment toolbarIconCrossAlignment;
  final bool showDividers;
  final bool showFontFamily;
  final bool showFontSize;
  final bool showBoldButton;
  final bool showItalicButton;
  final bool showSmallButton;
  final bool showUnderLineButton;
  final bool showStrikeThrough;
  final bool showInlineCode;
  final bool showColorButton;
  final bool showBackgroundColorButton;
  final bool showClearFormat;
  final bool showAlignmentButtons;
  final bool showLeftAlignment;
  final bool showCenterAlignment;
  final bool showRightAlignment;
  final bool showJustifyAlignment;
  final bool showHeaderStyle;
  final bool showListNumbers;
  final bool showListBullets;
  final bool showListCheck;
  final bool showCodeBlock;
  final bool showQuote;
  final bool showIndent;
  final bool showLink;
  final bool showUndo;
  final bool showRedo;
  final bool showDirection;
  final bool showSearchButton;
  final bool showSubscript;
  final bool showSuperscript;
  final List<QuillCustomButton> customButtons;

  /// The decoration to use for the toolbar.
  final Decoration? decoration;

  /// Toolbar items to display for controls of embed blocks
  final List<EmbedButtonBuilder>? embedButtons;

  ///The theme to use for the icons in the toolbar, uses type [QuillIconTheme]
  final QuillIconTheme? iconTheme;

  ///The theme to use for the theming of the [LinkDialog()],
  ///shown when embedding an image, for example
  final QuillDialogTheme? dialogTheme;

  /// The color of the toolbar
  final Color? color;

  /// The color of the toolbar section divider
  final Color? sectionDividerColor;

  /// The space occupied by toolbar divider
  final double? sectionDividerSpace;

  @override
  List<Object?> get props => [
        buttonOptions,
        multiRowsDisplay,
        fontFamilyValues,
        fontSizesValues,
        toolbarSize,
        axis,
      ];
}

/// The configurations for the buttons of the toolbar widget of flutter quill
@immutable
class QuillToolbarButtonOptions extends Equatable {
  const QuillToolbarButtonOptions({
    this.base = const QuillToolbarBaseButtonOptions(),
    this.undoHistory = const QuillToolbarHistoryButtonOptions(
      isUndo: true,
    ),
    this.redoHistory = const QuillToolbarHistoryButtonOptions(
      isUndo: false,
    ),
    this.fontFamily = const QuillToolbarFontFamilyButtonOptions(),
    this.fontSize = const QuillToolbarFontSizeButtonOptions(),
    this.bold = const QuillToolbarToggleStyleButtonOptions(),
    this.subscript = const QuillToolbarToggleStyleButtonOptions(),
    this.superscript = const QuillToolbarToggleStyleButtonOptions(),
    this.italic = const QuillToolbarToggleStyleButtonOptions(),
    this.small = const QuillToolbarToggleStyleButtonOptions(),
    this.underLine = const QuillToolbarToggleStyleButtonOptions(),
    this.strikeThrough = const QuillToolbarToggleStyleButtonOptions(),
    this.inlineCode = const QuillToolbarToggleStyleButtonOptions(),
    this.direction = const QuillToolbarToggleStyleButtonOptions(),
    this.listNumbers = const QuillToolbarToggleStyleButtonOptions(),
    this.listBullets = const QuillToolbarToggleStyleButtonOptions(),
    this.codeBlock = const QuillToolbarToggleStyleButtonOptions(),
    this.quote = const QuillToolbarToggleStyleButtonOptions(),
    this.toggleCheckList = const QuillToolbarToggleCheckListButtonOptions(),
    this.indentIncrease = const QuillToolbarIndentButtonOptions(),
    this.indentDecrease = const QuillToolbarIndentButtonOptions(),
    this.color = const QuillToolbarColorButtonOptions(),
    this.backgroundColor = const QuillToolbarColorButtonOptions(),
    this.clearFormat = const QuillToolbarClearFormatButtonOptions(),
    this.selectAlignmentButtons =
        const QuillToolbarSelectAlignmentButtonOptions(),
    this.search = const QuillToolbarSearchButtonOptions(),
    this.selectHeaderStyleButtons =
        const QuillToolbarSelectHeaderStyleButtonsOptions(),
    this.linkStyle = const QuillToolbarLinkStyleButtonOptions(),
  });

  /// The base configurations for all the buttons which will apply to all
  /// but if the options overrided in the spesefic button options
  /// then it will use that instead
  final QuillToolbarBaseButtonOptions base;
  final QuillToolbarHistoryButtonOptions undoHistory;
  final QuillToolbarHistoryButtonOptions redoHistory;
  final QuillToolbarFontFamilyButtonOptions fontFamily;
  final QuillToolbarFontSizeButtonOptions fontSize;
  final QuillToolbarToggleStyleButtonOptions bold;
  final QuillToolbarToggleStyleButtonOptions subscript;
  final QuillToolbarToggleStyleButtonOptions superscript;
  final QuillToolbarToggleStyleButtonOptions italic;
  final QuillToolbarToggleStyleButtonOptions small;
  final QuillToolbarToggleStyleButtonOptions underLine;
  final QuillToolbarToggleStyleButtonOptions strikeThrough;
  final QuillToolbarToggleStyleButtonOptions inlineCode;
  final QuillToolbarToggleStyleButtonOptions direction;
  final QuillToolbarToggleStyleButtonOptions listNumbers;
  final QuillToolbarToggleStyleButtonOptions listBullets;
  final QuillToolbarToggleStyleButtonOptions codeBlock;
  final QuillToolbarToggleStyleButtonOptions quote;
  final QuillToolbarToggleCheckListButtonOptions toggleCheckList;
  final QuillToolbarIndentButtonOptions indentIncrease;
  final QuillToolbarIndentButtonOptions indentDecrease;
  final QuillToolbarColorButtonOptions color;
  final QuillToolbarColorButtonOptions backgroundColor;
  final QuillToolbarClearFormatButtonOptions clearFormat;

  /// The reason we call this buttons in the end because this is responsible
  /// for all the alignment buttons and not just one, you still
  /// can customize the icons and tooltips
  /// and you have child builder
  final QuillToolbarSelectAlignmentButtonOptions selectAlignmentButtons;

  final QuillToolbarSearchButtonOptions search;

  /// The reason we call this buttons in the end because this is responsible
  /// for all the header style buttons and not just one, you still
  /// can customize it and you also have child builder
  final QuillToolbarSelectHeaderStyleButtonsOptions selectHeaderStyleButtons;

  final QuillToolbarLinkStyleButtonOptions linkStyle;

  @override
  List<Object?> get props => [
        base,
      ];
}
