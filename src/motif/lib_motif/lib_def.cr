@[Link("Xm")]
lib LibXm
  CR_DROP_SITE_LEAVE_MESSAGE = 1
  CR_DROP_SITE_ENTER_MESSAGE = 2
  CR_DROP_SITE_MOTION_MESSAGE = 3
  CR_DROP_MESSAGE = 4
  NO_DROP_SITE = 1
  INVALID_DROP_SITE = 2
  VALID_DROP_SITE = 3
  HELP = 2
  VERSION = 2
  REVISION = 3
  UPDATE_LEVEL = 6
  UNSPECIFIED_PIXMAP = 2
  UNSPECIFIED_POSITION = -1
  DEFAULT_DARK_THRESHOLD = 20
  DEFAULT_LIGHT_THRESHOLD = 93
  DEFAULT_FOREGROUND_THRESHOLD = 70
  DIRECTION_IGNORED = 48
  RIGHT_TO_LEFT_MASK = 1
  LEFT_TO_RIGHT_MASK = 2
  HORIZONTAL_MASK = 3
  TOP_TO_BOTTOM_MASK = 4
  BOTTOM_TO_TOP_MASK = 8
  VERTICAL_MASK = 12
  PRECEDENCE_HORIZ_MASK = 64
  PRECEDENCE_VERT_MASK = 128
  PRECEDENCE_MASK = 192
  AS_IS = 255
  FORCE_COLOR = 1
  INVALID_POSITION = -1
  COPY_FAILED = 0
  COPY_SUCCEEDED = 1
  COPY_TRUNCATED = 2
  INDICATOR_3D_BOX = 1
  INDICATOR_FLAT_BOX = 2
  INDICATOR_CHECK_GLYPH = 16
  INDICATOR_CROSS_GLYPH = 32
  type XFontSet = Void*
  struct XRectangle
    x : LibC::Short
    y : LibC::Short
    width : LibC::UShort
    height : LibC::UShort
  end
  type Display = Void*
  alias Xid = LibC::ULong
  alias Drawable = Xid
  type Gc = Void*
  struct BTextItem
    chars : LibC::Char*
    nchars : LibC::Int
    delta : LibC::Int
    font_set : XFontSet
  end
  type Xic = Void*
  struct XKeyEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    window : Window
    root : Window
    subwindow : Window
    time : Time
    x : LibC::Int
    y : LibC::Int
    x_root : LibC::Int
    y_root : LibC::Int
    state : LibC::UInt
    keycode : LibC::UInt
    same_screen : LibC::Int
  end
  alias XKeyPressedEvent = XKeyEvent
  alias Window = Xid
  alias Time = LibC::ULong
  alias KeySym = Xid
  struct XSizeHints
    flags : LibC::Long
    x : LibC::Int
    y : LibC::Int
    width : LibC::Int
    height : LibC::Int
    min_width : LibC::Int
    min_height : LibC::Int
    max_width : LibC::Int
    max_height : LibC::Int
    width_inc : LibC::Int
    height_inc : LibC::Int
    min_aspect : XSizeHintsMinAspect
    max_aspect : XSizeHintsMinAspect
    base_width : LibC::Int
    base_height : LibC::Int
    win_gravity : LibC::Int
  end
  struct XSizeHintsMinAspect
    x : LibC::Int
    y : LibC::Int
  end
  struct XwmHints
    flags : LibC::Long
    input : LibC::Int
    initial_state : LibC::Int
    icon_pixmap : Pixmap
    icon_window : Window
    icon_x : LibC::Int
    icon_y : LibC::Int
    icon_mask : Pixmap
    window_group : Xid
  end
  alias Pixmap = Xid
  struct XClassHint
    res_name : LibC::Char*
    res_class : LibC::Char*
  end
  enum XiccEncodingStyle
    XStringStyle = 0
    XCompoundTextStyle = 1
    XTextStyle = 2
    XStdIccTextStyle = 3
    XutF8stringStyle = 4
  end
  struct XTextProperty
    value : UInt8*
    encoding : Atom
    format : LibC::Int
    nitems : LibC::ULong
  end
  alias Atom = LibC::ULong
  fun translate_key = XmTranslateKey(dpy : Display, keycode : KeyCode, modifiers : Modifiers, modifiers_return : Modifiers*, keysym_return : KeySym*)
  alias KeyCode = UInt8
  alias Modifiers = LibC::UInt
  DragUnderNone = 0
  DragUnderPixmap = 1
  DragUnderShadowIn = 2
  DragUnderShadowOut = 3
  DragUnderHighlight = 4
  DropSiteSimple = 0
  DropSiteComposite = 1
  DropSiteSimpleClipOnly = 128
  DropSiteCompositeClipOnly = 129
  Above = 0
  Below = 1
  DropSiteActive = 0
  DropSiteInactive = 1
  DropSiteIgnore = 2
  fun drop_site_register = XmDropSiteRegister(widget : Widget, args : ArgList, arg_count : Cardinal)
  type Widget = Void*
  struct ArgRec
    name : LibC::Char*
    value : XtArgVal
  end
  alias ArgList = ArgRec*
  #alias String = LibC::Char*
  alias XtArgVal = LibC::Long
  alias Cardinal = LibC::UInt
  fun drop_site_unregister = XmDropSiteUnregister(widget : Widget)
  fun drop_site_registered = XmDropSiteRegistered(widget : Widget) : Boolean
  alias Boolean = LibC::Char
  fun drop_site_start_update = XmDropSiteStartUpdate(ref_widget : Widget)
  fun drop_site_update = XmDropSiteUpdate(enclosing_widget : Widget, args : ArgList, arg_count : Cardinal)
  fun drop_site_end_update = XmDropSiteEndUpdate(ref_widget : Widget)
  fun drop_site_retrieve = XmDropSiteRetrieve(enclosing_widget : Widget, args : ArgList, arg_count : Cardinal)
  fun drop_site_query_stacking_order = XmDropSiteQueryStackingOrder(widget : Widget, parent_rtn : Widget*, children_rtn : Widget**, num_children_rtn : Cardinal*) : LibC::Int
  fun drop_site_configure_stacking_order = XmDropSiteConfigureStackingOrder(widget : Widget, sibling : Widget, stack_mode : Cardinal)
  fun drop_site_get_active_visuals = XmDropSiteGetActiveVisuals(widget : Widget) : DropSiteVisuals
  struct X_XmDropSiteVisualsRec
    background : Pixel
    foreground : Pixel
    top_shadow_color : Pixel
    top_shadow_pixmap : Pixmap
    bottom_shadow_color : Pixel
    bottom_shadow_pixmap : Pixmap
    shadow_thickness : Dimension
    highlight_color : Pixel
    highlight_pixmap : Pixmap
    highlight_thickness : Dimension
    border_width : Dimension
  end
  alias DropSiteVisuals = X_XmDropSiteVisualsRec*
  alias Pixel = LibC::ULong
  alias Dimension = LibC::UShort
  DragNone = 0
  DragDropOnly = 1
  DragPreferPreregister = 2
  DragPreregister = 3
  DragPreferDynamic = 4
  DragDynamic = 5
  DragPreferReceiver = 6
  fun get_drag_context = XmGetDragContext(w : Widget, time : Time) : Widget
  fun get_xm_display = XmGetXmDisplay(display : Display) : Widget
  TopLevelEnter = 0
  TopLevelLeave = 1
  DragMotion = 2
  DropSiteEnter = 3
  DropSiteLeave = 4
  DropStart = 5
  DropFinish = 6
  DragDropFinish = 7
  OperationChanged = 8
  Drop = 0
  DropHelp = 1
  DropCancel = 2
  DropInterrupt = 3
  Move = 1
  Copy = 2
  Link = 4
  Other = 5
  BlendAll = 0
  BlendStateSource = 1
  BlendJustSource = 2
  BlendNone = 3
  DropFailure = 0
  DropSuccess = 1
  CrTopLevelEnter = 0
  CrTopLevelLeave = 1
  CrDragMotion = 2
  CrDropSiteEnter = 3
  CrDropSiteLeave = 4
  CrDropStart = 5
  CrDropFinish = 6
  CrDragDropFinish = 7
  CrOperationChanged = 8
  fun drag_start = XmDragStart(w : Widget, event : XEvent*, args : ArgList, num_args : Cardinal) : Widget
  union X_XEvent
    type : LibC::Int
    xany : XAnyEvent
    xkey : XKeyEvent
    xbutton : XButtonEvent
    xmotion : XMotionEvent
    xcrossing : XCrossingEvent
    xfocus : XFocusChangeEvent
    xexpose : XExposeEvent
    xgraphicsexpose : XGraphicsExposeEvent
    xnoexpose : XNoExposeEvent
    xvisibility : XVisibilityEvent
    xcreatewindow : XCreateWindowEvent
    xdestroywindow : XDestroyWindowEvent
    xunmap : XUnmapEvent
    xmap : XMapEvent
    xmaprequest : XMapRequestEvent
    xreparent : XReparentEvent
    xconfigure : XConfigureEvent
    xgravity : XGravityEvent
    xresizerequest : XResizeRequestEvent
    xconfigurerequest : XConfigureRequestEvent
    xcirculate : XCirculateEvent
    xcirculaterequest : XCirculateRequestEvent
    xproperty : XPropertyEvent
    xselectionclear : XSelectionClearEvent
    xselectionrequest : XSelectionRequestEvent
    xselection : XSelectionEvent
    xcolormap : XColormapEvent
    xclient : XClientMessageEvent
    xmapping : XMappingEvent
    xerror : XErrorEvent
    xkeymap : XKeymapEvent
    xgeneric : XGenericEvent
    xcookie : XGenericEventCookie
    pad : LibC::Long[24]
  end
  type XEvent = X_XEvent
  struct XAnyEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    window : Window
  end
  struct XButtonEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    window : Window
    root : Window
    subwindow : Window
    time : Time
    x : LibC::Int
    y : LibC::Int
    x_root : LibC::Int
    y_root : LibC::Int
    state : LibC::UInt
    button : LibC::UInt
    same_screen : LibC::Int
  end
  struct XMotionEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    window : Window
    root : Window
    subwindow : Window
    time : Time
    x : LibC::Int
    y : LibC::Int
    x_root : LibC::Int
    y_root : LibC::Int
    state : LibC::UInt
    is_hint : LibC::Char
    same_screen : LibC::Int
  end
  struct XCrossingEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    window : Window
    root : Window
    subwindow : Window
    time : Time
    x : LibC::Int
    y : LibC::Int
    x_root : LibC::Int
    y_root : LibC::Int
    mode : LibC::Int
    detail : LibC::Int
    same_screen : LibC::Int
    focus : LibC::Int
    state : LibC::UInt
  end
  struct XFocusChangeEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    window : Window
    mode : LibC::Int
    detail : LibC::Int
  end
  struct XExposeEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    window : Window
    x : LibC::Int
    y : LibC::Int
    width : LibC::Int
    height : LibC::Int
    count : LibC::Int
  end
  struct XGraphicsExposeEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    drawable : Drawable
    x : LibC::Int
    y : LibC::Int
    width : LibC::Int
    height : LibC::Int
    count : LibC::Int
    major_code : LibC::Int
    minor_code : LibC::Int
  end
  struct XNoExposeEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    drawable : Drawable
    major_code : LibC::Int
    minor_code : LibC::Int
  end
  struct XVisibilityEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    window : Window
    state : LibC::Int
  end
  struct XCreateWindowEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    parent : Window
    window : Window
    x : LibC::Int
    y : LibC::Int
    width : LibC::Int
    height : LibC::Int
    border_width : LibC::Int
    override_redirect : LibC::Int
  end
  struct XDestroyWindowEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    event : Window
    window : Window
  end
  struct XUnmapEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    event : Window
    window : Window
    from_configure : LibC::Int
  end
  struct XMapEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    event : Window
    window : Window
    override_redirect : LibC::Int
  end
  struct XMapRequestEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    parent : Window
    window : Window
  end
  struct XReparentEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    event : Window
    window : Window
    parent : Window
    x : LibC::Int
    y : LibC::Int
    override_redirect : LibC::Int
  end
  struct XConfigureEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    event : Window
    window : Window
    x : LibC::Int
    y : LibC::Int
    width : LibC::Int
    height : LibC::Int
    border_width : LibC::Int
    above : Window
    override_redirect : LibC::Int
  end
  struct XGravityEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    event : Window
    window : Window
    x : LibC::Int
    y : LibC::Int
  end
  struct XResizeRequestEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    window : Window
    width : LibC::Int
    height : LibC::Int
  end
  struct XConfigureRequestEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    parent : Window
    window : Window
    x : LibC::Int
    y : LibC::Int
    width : LibC::Int
    height : LibC::Int
    border_width : LibC::Int
    above : Window
    detail : LibC::Int
    value_mask : LibC::ULong
  end
  struct XCirculateEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    event : Window
    window : Window
    place : LibC::Int
  end
  struct XCirculateRequestEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    parent : Window
    window : Window
    place : LibC::Int
  end
  struct XPropertyEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    window : Window
    atom : Atom
    time : Time
    state : LibC::Int
  end
  struct XSelectionClearEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    window : Window
    selection : Atom
    time : Time
  end
  struct XSelectionRequestEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    owner : Window
    requestor : Window
    selection : Atom
    target : Atom
    property : Atom
    time : Time
  end
  struct XSelectionEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    requestor : Window
    selection : Atom
    target : Atom
    property : Atom
    time : Time
  end
  struct XColormapEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    window : Window
    colormap : Colormap
    new : LibC::Int
    state : LibC::Int
  end
  alias Colormap = Xid
  struct XClientMessageEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    window : Window
    message_type : Atom
    format : LibC::Int
    data : XClientMessageEventData
  end
  union XClientMessageEventData
    b : LibC::Char[20]
    s : LibC::Short[10]
    l : LibC::Long[5]
  end
  struct XMappingEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    window : Window
    request : LibC::Int
    first_keycode : LibC::Int
    count : LibC::Int
  end
  struct XErrorEvent
    type : LibC::Int
    display : Display
    resourceid : Xid
    serial : LibC::ULong
    error_code : UInt8
    request_code : UInt8
    minor_code : UInt8
  end
  struct XKeymapEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    window : Window
    key_vector : LibC::Char[32]
  end
  struct XGenericEvent
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    extension : LibC::Int
    evtype : LibC::Int
  end
  struct XGenericEventCookie
    type : LibC::Int
    serial : LibC::ULong
    send_event : LibC::Int
    display : Display
    extension : LibC::Int
    evtype : LibC::Int
    cookie : LibC::UInt
    data : Void*
  end
  fun drag_cancel = XmDragCancel(drag_context : Widget)
  fun targets_are_compatible = XmTargetsAreCompatible(dpy : Display, export_targets : Atom*, num_export_targets : Cardinal, import_targets : Atom*, num_import_targets : Cardinal) : Boolean
  TransferDoneSucceed = 0
  TransferDoneFail = 1
  TransferDoneContinue = 2
  TransferDoneDefault = 3
  SelectionDefault = 0
  SelectionIncremental = 1
  SelectionPersist = 2
  SelectionSnapshot = 3
  SelectionTransact = 4
  ConvertingNone = 0
  ConvertingSame = 1
  ConvertingTransact = 2
  ConvertingPartial = 4
  ConvertDefault = 0
  ConvertMore = 1
  ConvertMerge = 2
  ConvertRefuse = 3
  ConvertDone = 4
  fun transfer_done = XmTransferDone(x0 : XtPointer, x1 : TransferStatus)
  alias XtPointer = Void*
  enum TransferStatus
    TransferDoneSucceed = 0
    TransferDoneFail = 1
    TransferDoneContinue = 2
    TransferDoneDefault = 3
  end
  fun transfer_value = XmTransferValue(x0 : XtPointer, x1 : Atom, x2 : XtCallbackProc, x3 : XtPointer, x4 : Time)
  alias XtCallbackProc = (Widget, XtPointer, XtPointer -> Void)
  fun transfer_set_parameters = XmTransferSetParameters(x0 : XtPointer, x1 : XtPointer, x2 : LibC::Int, x3 : LibC::ULong, x4 : Atom)
  fun transfer_start_request = XmTransferStartRequest(x0 : XtPointer)
  fun transfer_send_request = XmTransferSendRequest(x0 : XtPointer, x1 : Time)
  RightToLeftTopToBottom = 69
  LeftToRightTopToBottom = 70
  RightToLeftBottomToTop = 73
  LeftToRightBottomToTop = 74
  TopToBottomRightToLeft = 133
  TopToBottomLeftToRight = 134
  BottomToTopRightToLeft = 137
  BottomToTopLeftToRight = 138
  TopToBottom = 199
  BottomToTop = 203
  RightToLeft = 205
  LeftToRight = 206
  DefaultDirection = 255
  fun direction_match = XmDirectionMatch(d1 : Direction, d2 : Direction) : Boolean
  alias Direction = UInt8
  fun direction_match_partial = XmDirectionMatchPartial(d1 : Direction, d2 : Direction, dmask : Direction) : Boolean
  FontIsFont = 0
  FontIsFontset = 1
  FontIsXft = 2
  StringDirectionLToR = 0
  StringDirectionRToL = 1
  StringDirectionUnset = 3
  StringDirectionDefault = 255
  StringComponentUnknown = 0
  StringComponentCharset = 1
  StringComponentText = 2
  StringComponentDirection = 3
  StringComponentSeparator = 4
  StringComponentLocaleText = 5
  StringComponentLocale = 6
  StringComponentWidecharText = 7
  StringComponentLayoutPush = 8
  StringComponentLayoutPop = 9
  StringComponentRenditionBegin = 10
  StringComponentRenditionEnd = 11
  StringComponentTab = 12
  CharsetText = 0
  MultibyteText = 1
  WidecharText = 2
  NoText = 3
  OutputAll = 0
  OutputBetween = 1
  OutputBeginning = 2
  OutputEnd = 3
  OutputBoth = 4
  Insert = 0
  Terminate = 1
  Invoke = 2
  StyleString = 0
  StyleCompoundText = 1
  StyleText = 2
  StyleStandardIccText = 3
  StyleLocale = 32
  StyleCompoundString = 33
  Absolute = 0
  Relative = 1
  Skip = 0
  MergeReplace = 1
  MergeOld = 2
  MergeNew = 3
  Duplicate = 4
  UnspecifiedLoadModel = 0
  LoadDeferred = 1
  LoadImmediate = 2
  ChangeAll = 0
  ChangeNone = 1
  ChangeWidth = 2
  ChangeHeight = 3
  Pixels = 0
  # 100thMillimeters = 1
  # 1000thInches = 2
  # 100thPoints = 3
  # 100thFontUnits = 4
  Inches = 5
  Centimeters = 6
  Millimeters = 7
  Points = 8
  FontUnits = 9
  Destroy = 0
  Unmap = 1
  DoNothing = 2
  Explicit = 0
  Pointer = 1
  None = 0
  TabGroup = 1
  StickyTabGroup = 2
  ExclusiveTabGroup = 3
  Bell = 1
  PerShell = 0
  PerWidget = 1
  InheritPolicy = 255
  NoOrientation = 0
  Vertical = 1
  Horizontal = 2
  WorkArea = 0
  MenuBar = 1
  MenuPulldown = 2
  MenuPopup = 3
  MenuOption = 4
  NoPacking = 0
  PackTight = 1
  PackColumn = 2
  PackNone = 3
  AlignmentContentsTop = 3
  AlignmentContentsBottom = 4
  TearOffEnabled = 0
  TearOffDisabled = 1
  Unpost = 0
  UnpostAndReplay = 1
  LastPosition = -1
  FirstPosition = 0
  PopupDisabled = 0
  PopupKeyboard = 1
  PopupAutomatic = 2
  PopupAutomaticRecursive = 3
  ListMode = 0
  ScaleMode = 1
  FillUnspecified = 0
  FillFlush = 1
  FillRagged = 2
  DistributeTight = 0
  DistributeSpread = 1
  ComboBox = 0
  DropDownComboBox = 1
  DropDownList = 2
  QuickNavigate = 1
  InvalidMatchBehavior = 2
  ZeroBased = 0
  OneBased = 1
  IconTop = 0
  IconLeft = 1
  IconRight = 2
  IconBottom = 3
  IconOnly = 4
  IconNone = 5
  FillNone = 0
  FillMajor = 1
  FillMinor = 2
  FillAll = 3
  AlwaysOpen = 0
  Open = 1
  Closed = 2
  Hidden = 3
  NotInHierarchy = 4
  TreeLadder = 0
  TreeDirect = 1
  TreeCompressNone = 0
  TreeCompressLeaves = 1
  TreeCompressAll = 2
  AlignmentBeginning = 0
  AlignmentCenter = 1
  AlignmentEnd = 2
  AlignmentUnspecified = 3
  AlignmentBaselineTop = 0
  AlignmentBaselineBottom = 2
  AlignmentWidgetTop = 3
  AlignmentWidgetBottom = 4
  FrameGenericChild = 0
  FrameWorkareaChild = 1
  FrameTitleChild = 2
  NOfMany = 1
  OneOfMany = 2
  OneOfManyRound = 3
  OneOfManyDiamond = 4
  AttachNone = 0
  AttachForm = 1
  AttachOppositeForm = 2
  AttachWidget = 3
  AttachOppositeWidget = 4
  AttachPosition = 5
  AttachSelf = 6
  ResizeNone = 0
  ResizeGrow = 1
  ResizeAny = 2
  TabsSquared = 0
  TabsRounded = 1
  TabsBeveled = 2
  TabsBasic = 0
  TabsStacked = 1
  TabsStackedStatic = 2
  TabsScrolled = 3
  TabsOverlayed = 4
  TabOrientationDynamic = 0
  TabsRightToLeft = 1
  TabsLeftToRight = 2
  TabsTopToBottom = 3
  TabsBottomToTop = 4
  TabEdgeTopLeft = 0
  TabEdgeBottomRight = 1
  TabArrowsOnRight = 0
  TabArrowsOnLeft = 1
  TabArrowsSplit = 2
  CrTabSelected = 0
  CrTabUnselected = 1
  TabsOnTop = 0
  TabsOnBottom = 1
  TabsOnRight = 2
  TabsOnLeft = 3
  PixmapTop = 0
  PixmapBottom = 1
  PixmapRight = 2
  PixmapLeft = 3
  PixmapNone = 4
  PixmapOnly = 5
  TabValueCopy = 0
  TabValueShare = 1
  TabCmpVisual = 0
  TabCmpSize = 1
  TabCmpEqual = 2
  CrNone = 0
  CrHelp = 1
  CrValueChanged = 2
  CrIncrement = 3
  CrDecrement = 4
  CrPageIncrement = 5
  CrPageDecrement = 6
  CrToTop = 7
  CrToBottom = 8
  CrDrag = 9
  CrActivate = 10
  CrArm = 11
  CrDisarm = 12
  CrMap = 16
  CrUnmap = 17
  CrFocus = 18
  CrLosingFocus = 19
  CrModifyingTextValue = 20
  CrMovingInsertCursor = 21
  CrExecute = 22
  CrSingleSelect = 23
  CrMultipleSelect = 24
  CrExtendedSelect = 25
  CrBrowseSelect = 26
  CrDefaultAction = 27
  CrClipboardDataRequest = 28
  CrClipboardDataDelete = 29
  CrCascading = 30
  CrOk = 31
  CrCancel = 32
  CrApply = 34
  CrNoMatch = 35
  CrCommandEntered = 36
  CrCommandChanged = 37
  CrExpose = 38
  CrResize = 39
  CrInput = 40
  CrGainPrimary = 41
  CrLosePrimary = 42
  CrCreate = 43
  CrTearOffActivate = 44
  CrTearOffDeactivate = 45
  CrObscuredTraversal = 46
  CrFocusMoved = 47
  CrRepost = 54
  CrCollapsed = 55
  CrExpanded = 56
  CrSelect = 57
  CrDragStart = 58
  CrNoFont = 59
  CrNoRendition = 60
  CrPost = 61
  CrSpinNext = 62
  CrSpinPrior = 63
  CrSpinFirst = 64
  CrSpinLast = 65
  CrPageScrollerIncrement = 66
  CrPageScrollerDecrement = 67
  CrMajorTab = 68
  CrMinorTab = 69
  CrStartJob = 70
  CrEndJob = 71
  CrPageSetup = 72
  CrPdmNone = 73
  CrPdmUp = 74
  CrPdmStartError = 75
  CrPdmStartVxauth = 76
  CrPdmStartPxauth = 77
  CrPdmOk = 78
  CrPdmCancel = 79
  CrPdmExitError = 80
  CrUpdateShell = 81
  CrUpdateText = 82
  CrVerifyText = 83
  CrVerifyTextFailed = 84
  CrEnterChild = 85
  CrLeaveChild = 86
  CrProtocols = 6666
  EachSide = 1
  MaxSide = 2
  MinSide = 3
  Slider = 0
  Thermometer = 1
  BackgroundColor = 0
  ForegroundColor = 1
  TroughColor = 2
  ShadowedBackground = 3
  EtchedLine = 1
  ThumbMark = 2
  RoundMark = 3
  NearSlider = 1
  NearBorder = 2
  HorScrollbar = 2
  VertScrollbar = 3
  CommandWindow = 4
  MessageWindow = 6
  ScrollHor = 7
  ScrollVert = 8
  NoScroll = 9
  ClipWindow = 10
  GenericChild = 11
  AutoDragEnabled = 0
  AutoDragDisabled = 1
  EnableWarpOn = 0
  EnableWarpOff = 1
  Off = 0
  ButtoN2Adjust = 1
  ButtoN2Transfer = 2
  AutoUnset = 0
  AutoBegin = 1
  AutoMotion = 2
  AutoCancel = 3
  AutoNoChange = 4
  AutoChange = 5
  MulticlickDiscard = 0
  MulticlickKeep = 1
  ShadowIn = 7
  ShadowOut = 8
  ArrowUp = 0
  ArrowDown = 1
  ArrowLeft = 2
  ArrowRight = 3
  NoLine = 0
  SingleLine = 1
  DoubleLine = 2
  SingleDashedLine = 3
  DoubleDashedLine = 4
  ShadowEtchedIn = 5
  ShadowEtchedOut = 6
  ShadowEtchedInDash = 7
  ShadowEtchedOutDash = 8
  InvalidSeparatorType = 9
  #Pixmap = 1
  String = 2
  PixmapAndString = 3
  #Window = 0
  #Cursor = 2
  DragWindow = 3
  MaxOnTop = 0
  MaxOnBottom = 1
  MaxOnLeft = 2
  MaxOnRight = 3
  SingleSelect = 0
  MultipleSelect = 1
  ExtendedSelect = 2
  BrowseSelect = 3
  Static = 0
  Dynamic = 1
  NormalMode = 0
  AddMode = 1
  NoAutoSelect = 0
  AutoSelect = 1
  Single = 1
  AnyIcon = 2
  Append = 0
  Closest = 1
  FirstFit = 2
  Outline = 0
  Spatial = 1
  Detail = 2
  OutlineButtonPresent = 0
  OutlineButtonAbsent = 1
  Grid = 1
  Cells = 2
  OwnNever = 0
  OwnAlways = 1
  OwnMultiple = 2
  OwnPossibleMultiple = 3
  GrowMinor = 0
  GrowMajor = 1
  GrowBalanced = 2
  Marquee = 0
  MarqueeExtendStart = 1
  MarqueeExtendBoth = 2
  TouchOnly = 3
  TouchOver = 4
  SnapToGrid = 1
  Center = 2
  Collapsed = 0
  Expanded = 1
  LargeIcon = 0
  SmallIcon = 1
  Selected = 0
  NotSelected = 1
  Solid = 2
  Spiral = 3
  PixmapOverlapOnly = 4
  Page = 1
  MajorTab = 2
  MinorTab = 3
  StatusArea = 4
  PageScroller = 5
  ArrowsVertical = 0
  ArrowsHorizontal = 1
  ArrowsEnd = 0
  ArrowsBeginning = 1
  ArrowsSplit = 2
  ArrowsFlatEnd = 3
  ArrowsFlatBeginning = 4
  ArrowsInsensitive = 0
  ArrowsIncrementSensitive = 1
  ArrowsDecrementSensitive = 2
  ArrowsSensitive = 3
  ArrowsDefaultSensitivity = 4
  PositionIndex = 0
  PositionValue = 1
  Numeric = 3
  ValidValue = 0
  CurrentValue = 1
  MaximumValue = 2
  MinimumValue = 3
  IncrementValue = 4
  Variable = 0
  Constant = 1
  ResizeIfPossible = 2
  Automatic = 0
  ApplicationDefined = 1
  AsNeeded = 1
  CommandAboveWorkspace = 0
  CommandBelowWorkspace = 1
  MultiLineEdit = 0
  SingleLineEdit = 1
  TextForward = 0
  TextBackward = 1
  SelectPosition = 0
  SelectWhitespace = 1
  SelectWord = 2
  SelectLine = 3
  SelectAll = 4
  SelectParagraph = 5
  SelectOutLine = 6
  HighlightNormal = 0
  HighlightSelected = 1
  HighlightSecondarySelected = 2
  SeeDetail = 3
  DialogNone = 0
  DialogApplyButton = 1
  DialogCancelButton = 2
  DialogDefaultButton = 3
  DialogOkButton = 4
  DialogFilterLabel = 5
  DialogFilterText = 6
  DialogHelpButton = 7
  DialogList = 8
  DialogListLabel = 9
  DialogMessageLabel = 10
  DialogSelectionLabel = 11
  DialogSymbolLabel = 12
  DialogText = 13
  DialogSeparator = 14
  DialogDirList = 15
  DialogDirListLabel = 16
  DialogModeless = 0
  DialogPrimaryApplicationModal = 1
  DialogFullApplicationModal = 2
  DialogSystemModal = 3
  PlaceTop = 0
  PlaceAboveSelection = 1
  PlaceBelowSelection = 2
  DialogWorkArea = 0
  DialogPrompt = 1
  DialogSelection = 2
  DialogCommand = 3
  DialogFileSelection = 4
  DialogTemplate = 0
  DialogError = 1
  DialogInformation = 2
  DialogMessage = 3
  DialogQuestion = 4
  DialogWarning = 5
  DialogWorking = 6
  VisibilityUnobscured = 0
  VisibilityPartiallyObscured = 1
  VisibilityFullyObscured = 2
  TraverseCurrent = 0
  TraverseNext = 1
  TraversePrev = 2
  TraverseHome = 3
  TraverseNextTabGroup = 4
  TraversePrevTabGroup = 5
  TraverseUp = 6
  TraverseDown = 7
  TraverseLeft = 8
  TraverseRight = 9
  TraverseGloballyForward = 10
  TraverseGloballyBackward = 11
  Pushbutton = 1
  Togglebutton = 2
  Radiobutton = 3
  Cascadebutton = 4
  Separator = 5
  DoubleSeparator = 6
  Title = 7
  MatchDepth = 0
  DynamicDepth = 1
  PdmNotifyFail = 0
  PdmNotifySuccess = 1
  MultilistFound = 0
  MultilistNotFound = 1
  DropdownLabel = 0
  DropdownText = 1
  DropdownArrowButton = 2
  DropdownList = 3
  fun cvt_xm_string_table_to_text_property = XmCvtXmStringTableToTextProperty(display : Display, string_table : StringTable, count : LibC::Int, style : IccEncodingStyle, text_prop_return : XTextProperty*) : LibC::Int
  alias StringTable = LibC::Char**
  enum IccEncodingStyle
    StyleString = 0
    StyleCompoundText = 1
    StyleText = 2
    StyleStandardIccText = 3
    StyleLocale = 32
    StyleCompoundString = 33
  end
  fun cvt_text_property_to_xm_string_table = XmCvtTextPropertyToXmStringTable(display : Display, text_prop : XTextProperty*, string_table_return : StringTable*, count_return : LibC::Int*) : LibC::Int
  fun get_secondary_resource_data = XmGetSecondaryResourceData(w_class : WidgetClass, secondary_data_rtn : SecondaryResourceData**) : Cardinal
  type WidgetClass = Void*
  struct X_XmSecondaryResourceDataRec
    base_proc : ResourceBaseProc
    client_data : XtPointer
    name : LibC::Char*
    res_class : LibC::Char*
    resources : XtResourceList
    num_resources : Cardinal
  end
  alias SecondaryResourceData = X_XmSecondaryResourceDataRec*
  alias ResourceBaseProc = (Widget, XtPointer -> XtPointer)
  struct X_XtResource
    resource_name : LibC::Char*
    resource_class : LibC::Char*
    resource_type : LibC::Char*
    resource_size : Cardinal
    resource_offset : Cardinal
    default_type : LibC::Char*
    default_addr : XtPointer
  end
  alias XtResourceList = X_XtResource*
  fun install_image = XmInstallImage(image : XImage*, image_name : LibC::Char*) : Boolean
  struct X_XImage
    width : LibC::Int
    height : LibC::Int
    xoffset : LibC::Int
    format : LibC::Int
    data : LibC::Char*
    byte_order : LibC::Int
    bitmap_unit : LibC::Int
    bitmap_bit_order : LibC::Int
    bitmap_pad : LibC::Int
    depth : LibC::Int
    bytes_per_line : LibC::Int
    bits_per_pixel : LibC::Int
    red_mask : LibC::ULong
    green_mask : LibC::ULong
    blue_mask : LibC::ULong
    obdata : XPointer
    f : Funcs
  end
  type XImage = X_XImage
  alias XPointer = LibC::Char*
  struct Funcs
    create_image : (X_XDisplay*, Visual*, LibC::UInt, LibC::Int, LibC::Int, LibC::Char*, LibC::UInt, LibC::UInt, LibC::Int, LibC::Int -> X_XImage*)
    destroy_image : (X_XImage* -> LibC::Int)
    get_pixel : (X_XImage*, LibC::Int, LibC::Int -> LibC::ULong)
    put_pixel : (X_XImage*, LibC::Int, LibC::Int, LibC::ULong -> LibC::Int)
    sub_image : (X_XImage*, LibC::Int, LibC::Int, LibC::UInt, LibC::UInt -> X_XImage*)
    add_pixel : (X_XImage*, LibC::Long -> LibC::Int)
  end
  alias X_XDisplay = Void
  struct Visual
    ext_data : XExtData*
    visualid : VisualId
    class : LibC::Int
    red_mask : LibC::ULong
    green_mask : LibC::ULong
    blue_mask : LibC::ULong
    bits_per_rgb : LibC::Int
    map_entries : LibC::Int
  end
  struct X_XExtData
    number : LibC::Int
    next : X_XExtData*
    free_private : (X_XExtData* -> LibC::Int)
    private_data : XPointer
  end
  type XExtData = X_XExtData
  alias VisualId = LibC::ULong
  fun uninstall_image = XmUninstallImage(image : XImage*) : Boolean
  fun get_pixmap = XmGetPixmap(screen : Screen*, image_name : LibC::Char*, foreground : Pixel, background : Pixel) : Pixmap
  struct Screen
    ext_data : XExtData*
    display : X_XDisplay*
    root : Window
    width : LibC::Int
    height : LibC::Int
    mwidth : LibC::Int
    mheight : LibC::Int
    ndepths : LibC::Int
    depths : Depth*
    root_depth : LibC::Int
    root_visual : Visual*
    default_gc : Gc
    cmap : Colormap
    white_pixel : LibC::ULong
    black_pixel : LibC::ULong
    max_maps : LibC::Int
    min_maps : LibC::Int
    backing_store : LibC::Int
    save_unders : LibC::Int
    root_input_mask : LibC::Long
  end
  struct Depth
    depth : LibC::Int
    nvisuals : LibC::Int
    visuals : Visual*
  end
  fun get_pixmap_by_depth = XmGetPixmapByDepth(screen : Screen*, image_name : LibC::Char*, foreground : Pixel, background : Pixel, depth : LibC::Int) : Pixmap
  fun destroy_pixmap = XmDestroyPixmap(screen : Screen*, pixmap : Pixmap) : Boolean
  fun resolve_all_part_offsets = XmResolveAllPartOffsets(w_class : WidgetClass, offset : OffsetPtr*, constraint_offset : OffsetPtr*)
  alias Offset = LibC::Long
  alias OffsetPtr = Offset*
  fun resolve_part_offsets = XmResolvePartOffsets(w_class : WidgetClass, offset : OffsetPtr*)
  fun update_display = XmUpdateDisplay(w : Widget)
  fun object_at_point = XmObjectAtPoint(wid : Widget, x : Position, y : Position) : Widget
  alias Position = LibC::Short
  fun widget_get_baselines = XmWidgetGetBaselines(wid : Widget, baselines : Dimension**, line_count : LibC::Int*) : Boolean
  fun widget_get_display_rect = XmWidgetGetDisplayRect(wid : Widget, displayrect : XRectangle*) : Boolean
  fun cvt_string_to_unit_type = XmCvtStringToUnitType(args : XrmValuePtr, num_args : Cardinal*, from_val : Unknown*, to_val : Unknown*)
  struct Unknown
    size : LibC::UInt
    addr : XPointer
  end
  alias XrmValuePtr = Unknown*
  fun register_segment_encoding = XmRegisterSegmentEncoding(fontlist_tag : LibC::Char*, ct_encoding : LibC::Char*) : LibC::Char*
  fun map_segment_encoding = XmMapSegmentEncoding(fontlist_tag : LibC::Char*) : LibC::Char*
  fun cvt_ct_to_xm_string = XmCvtCTToXmString(text : LibC::Char*) : LibC::Char*
  fun cvt_text_to_xm_string = XmCvtTextToXmString(display : Display, args : XrmValuePtr, num_args : Cardinal*, from_val : Unknown*, to_val : Unknown*, converter_data : XtPointer*) : Boolean
  fun cvt_xm_string_to_ct = XmCvtXmStringToCT(string : LibC::Char*) : LibC::Char*
  fun cvt_xm_string_to_text = XmCvtXmStringToText(display : Display, args : XrmValuePtr, num_args : Cardinal*, from_val : Unknown*, to_val : Unknown*, converter_data : XtPointer*) : Boolean
  fun cvt_xm_string_to_ut_f8string = XmCvtXmStringToUTF8String(string : LibC::Char*) : LibC::Char*
  fun convert_string_to_units = XmConvertStringToUnits(screen : Screen*, spec : LibC::Char*, orientation : LibC::Int, to_type : LibC::Int, parse_error : XtEnum*) : LibC::Int
  alias XtEnum = UInt8
  fun convert_units = XmConvertUnits(widget : Widget, dimension : LibC::Int, from_type : LibC::Int, from_val : LibC::Int, to_type : LibC::Int) : LibC::Int
  fun cvt_to_horizontal_pixels = XmCvtToHorizontalPixels(screen : Screen*, from_val : LibC::Int, from_type : LibC::Int) : LibC::Int
  fun cvt_to_vertical_pixels = XmCvtToVerticalPixels(screen : Screen*, from_val : LibC::Int, from_type : LibC::Int) : LibC::Int
  fun cvt_from_horizontal_pixels = XmCvtFromHorizontalPixels(screen : Screen*, from_val : LibC::Int, to_type : LibC::Int) : LibC::Int
  fun cvt_from_vertical_pixels = XmCvtFromVerticalPixels(screen : Screen*, from_val : LibC::Int, to_type : LibC::Int) : LibC::Int
  fun set_font_units = XmSetFontUnits(display : Display, h_value : LibC::Int, v_value : LibC::Int)
  fun set_font_unit = XmSetFontUnit(display : Display, value : LibC::Int)
  fun set_menu_cursor = XmSetMenuCursor(display : Display, cursor_id : Cursor)
  alias Cursor = Xid
  fun get_menu_cursor = XmGetMenuCursor(display : Display) : Cursor
  fun create_simple_menu_bar = XmCreateSimpleMenuBar(parent : Widget, name : LibC::Char*, args : ArgList, arg_count : Cardinal) : Widget
  fun create_simple_popup_menu = XmCreateSimplePopupMenu(parent : Widget, name : LibC::Char*, args : ArgList, arg_count : Cardinal) : Widget
  fun create_simple_pulldown_menu = XmCreateSimplePulldownMenu(parent : Widget, name : LibC::Char*, args : ArgList, arg_count : Cardinal) : Widget
  fun create_simple_option_menu = XmCreateSimpleOptionMenu(parent : Widget, name : LibC::Char*, args : ArgList, arg_count : Cardinal) : Widget
  fun create_simple_radio_box = XmCreateSimpleRadioBox(parent : Widget, name : LibC::Char*, args : ArgList, arg_count : Cardinal) : Widget
  fun create_simple_check_box = XmCreateSimpleCheckBox(parent : Widget, name : LibC::Char*, args : ArgList, arg_count : Cardinal) : Widget
  fun va_create_simple_menu_bar = XmVaCreateSimpleMenuBar(parent : Widget, name : LibC::Char*, ...) : Widget
  fun va_create_simple_popup_menu = XmVaCreateSimplePopupMenu(parent : Widget, name : LibC::Char*, callback : XtCallbackProc, ...) : Widget
  fun va_create_simple_pulldown_menu = XmVaCreateSimplePulldownMenu(parent : Widget, name : LibC::Char*, post_from_button : LibC::Int, callback : XtCallbackProc, ...) : Widget
  fun va_create_simple_option_menu = XmVaCreateSimpleOptionMenu(parent : Widget, name : LibC::Char*, option_label : LibC::Char*, option_mnemonic : KeySym, button_set : LibC::Int, callback : XtCallbackProc, ...) : Widget
  fun va_create_simple_radio_box = XmVaCreateSimpleRadioBox(parent : Widget, name : LibC::Char*, button_set : LibC::Int, callback : XtCallbackProc, ...) : Widget
  fun va_create_simple_check_box = XmVaCreateSimpleCheckBox(parent : Widget, name : LibC::Char*, callback : XtCallbackProc, ...) : Widget
  fun tracking_event = XmTrackingEvent(widget : Widget, cursor : Cursor, confine_to : Boolean, pev : XEvent*) : Widget
  fun tracking_locate = XmTrackingLocate(widget : Widget, cursor : Cursor, confine_to : Boolean) : Widget
  fun set_color_calculation = XmSetColorCalculation(proc : ColorProc) : ColorProc
  struct XColor
    pixel : LibC::ULong
    red : LibC::UShort
    green : LibC::UShort
    blue : LibC::UShort
    flags : LibC::Char
    pad : LibC::Char
  end
  alias ColorProc = (XColor*, XColor*, XColor*, XColor*, XColor* -> Void)
  fun get_color_calculation = XmGetColorCalculation : ColorProc
  fun get_colors = XmGetColors(screen : Screen*, color_map : Colormap, background : Pixel, foreground_ret : Pixel*, top_shadow_ret : Pixel*, bottom_shadow_ret : Pixel*, select_ret : Pixel*)
  fun change_color = XmChangeColor(widget : Widget, background : Pixel)
  fun string_create = XmStringCreate(text : LibC::Char*, charset : StringCharSet) : LibC::Char*
  alias StringCharSet = LibC::Char*
  #fun string_create_simple = XmStringCreateSimple(text : LibC::Char*) : XmString
  fun string_create_localized = XmStringCreateLocalized(text : LibC::Char*) : LibC::Char*
  #fun string_direction_create = XmStringDirectionCreate(direction : StringDirection) : XmString
  alias StringDirection = UInt8
  #fun string_separator_create = XmStringSeparatorCreate : XmString
  #fun string_segment_create = XmStringSegmentCreate(text : LibC::Char*, charset : StringCharSet, direction : StringDirection, separator : Boolean) : XmString
  #fun string_lto_r_create = XmStringLtoRCreate(text : LibC::Char*, charset : StringCharSet) : XmString
  #fun string_create_lto_r = XmStringCreateLtoR(text : LibC::Char*, charset : StringCharSet) : XmString
  #fun string_init_context = XmStringInitContext(context : StringContext*, string : XmString) : Boolean
  type StringContext = Void*
  #fun string_free_context = XmStringFreeContext(context : StringContext)
  fun string_get_next_component = XmStringGetNextComponent(context : StringContext, text : LibC::Char**, charset : StringCharSet*, direction : StringDirection*, unknown_tag : StringComponentType*, unknown_length : LibC::UShort*, unknown_value : UInt8**) : StringComponentType
  alias StringComponentType = UInt8
  #fun string_peek_next_component = XmStringPeekNextComponent(context : StringContext) : StringComponentType
  fun string_get_next_segment = XmStringGetNextSegment(context : StringContext, text : LibC::Char**, charset : StringCharSet*, direction : StringDirection*, separator : Boolean*) : Boolean
  #fun string_get_lto_r = XmStringGetLtoR(string : XmString, charset : StringCharSet, text : LibC::Char**) : Boolean
  fun font_list_entry_create = XmFontListEntryCreate(tag : LibC::Char*, type : FontType, font : XtPointer) : FontListEntry
  enum FontType
    FontIsFont = 0
    FontIsFontset = 1
    FontIsXft = 2
  end
  alias X__XmRenditionRec = Void
  alias FontListEntry = X__XmRenditionRec**
  fun font_list_entry_create_r = XmFontListEntryCreate_r(tag : LibC::Char*, type : FontType, font : XtPointer, wid : Widget) : FontListEntry
  fun font_list_entry_free = XmFontListEntryFree(entry : FontListEntry*)
  fun font_list_entry_get_font = XmFontListEntryGetFont(entry : FontListEntry, type_return : FontType*) : XtPointer
  fun font_list_entry_get_tag = XmFontListEntryGetTag(entry : FontListEntry) : LibC::Char*
  fun font_list_append_entry = XmFontListAppendEntry(old : FontList, entry : FontListEntry) : FontList
  alias X__XmRenderTableRec = Void
  alias FontList = X__XmRenderTableRec**
  fun font_list_next_entry = XmFontListNextEntry(context : FontContext) : FontListEntry
  type FontContext = Void*
  fun font_list_remove_entry = XmFontListRemoveEntry(old : FontList, entry : FontListEntry) : FontList
  fun font_list_entry_load = XmFontListEntryLoad(display : Display, font_name : LibC::Char*, type : FontType, tag : LibC::Char*) : FontListEntry
  fun font_list_create = XmFontListCreate(font : XFontStruct*, charset : StringCharSet) : FontList
  struct XFontStruct
    ext_data : XExtData*
    fid : Font
    direction : LibC::UInt
    min_char_or_byte2 : LibC::UInt
    max_char_or_byte2 : LibC::UInt
    min_byte1 : LibC::UInt
    max_byte1 : LibC::UInt
    all_chars_exist : LibC::Int
    default_char : LibC::UInt
    n_properties : LibC::Int
    properties : XFontProp*
    min_bounds : XCharStruct
    max_bounds : XCharStruct
    per_char : XCharStruct*
    ascent : LibC::Int
    descent : LibC::Int
  end
  alias Font = Xid
  struct XFontProp
    name : Atom
    card32 : LibC::ULong
  end
  struct XCharStruct
    lbearing : LibC::Short
    rbearing : LibC::Short
    width : LibC::Short
    ascent : LibC::Short
    descent : LibC::Short
    attributes : LibC::UShort
  end
  fun font_list_create_r = XmFontListCreate_r(font : XFontStruct*, charset : StringCharSet, wid : Widget) : FontList
  fun string_create_font_list = XmStringCreateFontList(font : XFontStruct*, charset : StringCharSet) : FontList
  fun string_create_font_list_r = XmStringCreateFontList_r(font : XFontStruct*, charset : StringCharSet, wid : Widget) : FontList
  fun font_list_free = XmFontListFree(fontlist : FontList)
  fun font_list_add = XmFontListAdd(old : FontList, font : XFontStruct*, charset : StringCharSet) : FontList
  fun font_list_copy = XmFontListCopy(fontlist : FontList) : FontList
  fun font_list_init_font_context = XmFontListInitFontContext(context : FontContext*, fontlist : FontList) : Boolean
  fun font_list_get_next_font = XmFontListGetNextFont(context : FontContext, charset : StringCharSet*, font : XFontStruct**) : Boolean
  fun font_list_free_font_context = XmFontListFreeFontContext(context : FontContext)
  #fun string_concat = XmStringConcat(a : XmString, b : XmString) : XmString
  #fun string_concat_and_free = XmStringConcatAndFree(a : XmString, b : XmString) : XmString
  #fun string_n_concat = XmStringNConcat(first : XmString, second : XmString, n : LibC::Int) : XmString
  #fun string_copy = XmStringCopy(string : XmString) : XmString
  #fun string_n_copy = XmStringNCopy(str : XmString, n : LibC::Int) : XmString
  #fun string_byte_compare = XmStringByteCompare(a1 : XmString, b1 : XmString) : Boolean
  #fun string_compare = XmStringCompare(a : XmString, b : XmString) : Boolean
  #fun string_length = XmStringLength(string : XmString) : LibC::Int
  #fun string_empty = XmStringEmpty(string : XmString) : Boolean
  #fun string_is_void = XmStringIsVoid(string : XmString) : Boolean
  #fun string_has_substring = XmStringHasSubstring(string : XmString, substring : XmString) : Boolean
  fun string_free = XmStringFree(string : LibC::Char*)
  #fun string_baseline = XmStringBaseline(fontlist : FontList, string : XmString) : Dimension
  #fun string_width = XmStringWidth(fontlist : FontList, string : XmString) : Dimension
  #fun string_height = XmStringHeight(fontlist : FontList, string : XmString) : Dimension
  #fun string_extent = XmStringExtent(fontlist : FontList, string : XmString, width : Dimension*, height : Dimension*)
  #fun string_line_count = XmStringLineCount(string : XmString) : LibC::Int
  #fun string_draw = XmStringDraw(d : Display, w : Window, fontlist : FontList, string : XmString, gc : Gc, x : Position, y : Position, width : Dimension, align : UInt8, lay_dir : UInt8, clip : XRectangle*)
  #fun string_draw_image = XmStringDrawImage(d : Display, w : Window, fontlist : FontList, string : XmString, gc : Gc, x : Position, y : Position, width : Dimension, align : UInt8, lay_dir : UInt8, clip : XRectangle*)
  #fun string_draw_underline = XmStringDrawUnderline(d : Display, w : Window, fntlst : FontList, str : XmString, gc : Gc, x : Position, y : Position, width : Dimension, align : UInt8, lay_dir : UInt8, clip : XRectangle*, under : XmString)
  #fun cvt_xm_string_to_byte_stream = XmCvtXmStringToByteStream(string : XmString, prop_return : UInt8**) : LibC::UInt
  #fun cvt_byte_stream_to_xm_string = XmCvtByteStreamToXmString(property : UInt8*) : XmString
  fun string_byte_stream_length = XmStringByteStreamLength(string : UInt8*) : LibC::UInt
  fun string_peek_next_triple = XmStringPeekNextTriple(context : StringContext) : StringComponentType
  fun string_get_next_triple = XmStringGetNextTriple(context : StringContext, length : LibC::UInt*, value : XtPointer*) : StringComponentType
  #fun string_component_create = XmStringComponentCreate(tag : StringComponentType, length : LibC::UInt, value : XtPointer) : XmString
  #fun string_unparse = XmStringUnparse(string : XmString, tag : StringTag, tag_type : TextType, output_type : TextType, parse_table : ParseTable, parse_count : Cardinal, parse_model : ParseModel) : XtPointer
  alias StringTag = LibC::Char*
  enum TextType
    CharsetText = 0
    MultibyteText = 1
    WidecharText = 2
    NoText = 3
  end
  type ParseMapping = Void*
  alias ParseTable = ParseMapping*
  enum ParseModel
    OutputAll = 0
    OutputBetween = 1
    OutputBeginning = 2
    OutputEnd = 3
    OutputBoth = 4
  end
  #fun string_parse_text = XmStringParseText(text : XtPointer, text_end : XtPointer*, tag : StringTag, type : TextType, parse_table : ParseTable, parse_count : Cardinal, call_data : XtPointer) : XmString
  #fun string_to_xm_string_table = XmStringToXmStringTable(string : XmString, break_comp : XmString, table : StringTable*) : Cardinal
  #fun string_table_to_xm_string = XmStringTableToXmString(table : StringTable, count : Cardinal, break_component : XmString) : XmString
  fun string_table_unparse = XmStringTableUnparse(table : StringTable, count : Cardinal, tag : StringTag, tag_type : TextType, output_type : TextType, parse : ParseTable, parse_count : Cardinal, parse_model : ParseModel) : XtPointer*
  #fun string_table_parse_string_array = XmStringTableParseStringArray(strings : XtPointer*, count : Cardinal, tag : StringTag, type : TextType, parse : ParseTable, parse_count : Cardinal, call_data : XtPointer) : StringTable
  fun direction_to_string_direction = XmDirectionToStringDirection(dir : Direction) : StringDirection
  #fun string_direction_to_direction = XmStringDirectionToDirection(dir : StringDirection) : Direction
  #fun string_generate = XmStringGenerate(text : XtPointer, tag : StringTag, type : TextType, rendition : StringTag) : XmString
  #fun string_put_rendition = XmStringPutRendition(string : XmString, rendition : StringTag) : XmString
  fun parse_mapping_create = XmParseMappingCreate(arg_list : ArgList, arg_count : Cardinal) : ParseMapping
  fun parse_mapping_set_values = XmParseMappingSetValues(parse_mapping : ParseMapping, arg_list : ArgList, arg_count : Cardinal)
  fun parse_mapping_get_values = XmParseMappingGetValues(parse_mapping : ParseMapping, arg_list : ArgList, arg_count : Cardinal)
  fun parse_mapping_free = XmParseMappingFree(parse_mapping : ParseMapping)
  fun parse_table_free = XmParseTableFree(parse_table : ParseTable, parse_count : Cardinal)
  fun string_table_propose_tablist = XmStringTableProposeTablist(strings : StringTable, num_strings : Cardinal, widget : Widget, pad_value : LibC::Float, offset_model : OffsetModel) : TabList
  enum OffsetModel
    Absolute = 0
    Relative = 1
  end
  type TabList = Void*
  fun tab_set_value = XmTabSetValue(xmtab : Tab, value : LibC::Float)
  type Tab = Void*
  fun tab_get_values = XmTabGetValues(xmtab : Tab, units : UInt8*, offset : OffsetModel*, alignment : UInt8*, decimal : LibC::Char**) : LibC::Float
  fun tab_free = XmTabFree(xmtab : Tab)
  fun tab_create = XmTabCreate(value : LibC::Float, units : UInt8, offset_model : OffsetModel, alignment : UInt8, decimal : LibC::Char*) : Tab
  fun tab_list_remove_tabs = XmTabListRemoveTabs(oldlist : TabList, position_list : Cardinal*, position_count : Cardinal) : TabList
  fun tab_list_replace_positions = XmTabListReplacePositions(oldlist : TabList, position_list : Cardinal*, tabs : Tab*, tab_count : Cardinal) : TabList
  fun tab_list_get_tab = XmTabListGetTab(tablist : TabList, position : Cardinal) : Tab
  fun tab_list_tab_count = XmTabListTabCount(tablist : TabList) : Cardinal
  fun tab_list_copy = XmTabListCopy(tablist : TabList, offset : LibC::Int, count : Cardinal) : TabList
  fun tab_list_free = XmTabListFree(tablist : TabList)
  fun tab_list_insert_tabs = XmTabListInsertTabs(oldlist : TabList, tabs : Tab*, tab_count : Cardinal, position : LibC::Int) : TabList
  fun render_table_cvt_from_prop = XmRenderTableCvtFromProp(x0 : Widget, prop : LibC::Char*, len : LibC::UInt) : RenderTable
  alias RenderTable = X__XmRenderTableRec**
  fun render_table_cvt_to_prop = XmRenderTableCvtToProp(x0 : Widget, table : RenderTable, prop_return : LibC::Char**) : LibC::UInt
  fun rendition_update = XmRenditionUpdate(rendition : Rendition, arglist : ArgList, argcount : Cardinal)
  alias Rendition = X__XmRenditionRec**
  fun rendition_retrieve = XmRenditionRetrieve(rendition : Rendition, arglist : ArgList, argcount : Cardinal)
  fun rendition_free = XmRenditionFree(rendition : Rendition)
  fun rendition_create = XmRenditionCreate(widget : Widget, tag : StringTag, arglist : ArgList, argcount : Cardinal) : Rendition
  fun render_table_get_renditions = XmRenderTableGetRenditions(table : RenderTable, tags : StringTag*, tag_count : Cardinal) : Rendition*
  fun render_table_get_rendition = XmRenderTableGetRendition(table : RenderTable, tag : StringTag) : Rendition
  fun render_table_get_tags = XmRenderTableGetTags(table : RenderTable, tag_list : StringTag**) : LibC::Int
  fun render_table_free = XmRenderTableFree(table : RenderTable)
  fun render_table_copy = XmRenderTableCopy(table : RenderTable, tags : StringTag*, tag_count : LibC::Int) : RenderTable
  fun render_table_remove_renditions = XmRenderTableRemoveRenditions(oldtable : RenderTable, tags : StringTag*, tag_count : LibC::Int) : RenderTable
  fun render_table_add_renditions = XmRenderTableAddRenditions(oldtable : RenderTable, renditions : Rendition*, rendition_count : Cardinal, merge_mode : MergeMode) : RenderTable
  enum MergeMode
    Skip = 0
    MergeReplace = 1
    MergeOld = 2
    MergeNew = 3
    Duplicate = 4
  end
  fun get_destination = XmGetDestination(display : Display) : Widget
  fun is_traversable = XmIsTraversable(wid : Widget) : Boolean
  fun get_visibility = XmGetVisibility(wid : Widget) : Visibility
  enum Visibility
    VisibilityUnobscured = 0
    VisibilityPartiallyObscured = 1
    VisibilityFullyObscured = 2
  end
  fun get_tab_group = XmGetTabGroup(wid : Widget) : Widget
  fun get_focus_widget = XmGetFocusWidget(wid : Widget) : Widget
  fun process_traversal = XmProcessTraversal(w : Widget, dir : TraversalDirection) : Boolean
  enum TraversalDirection
    TraverseCurrent = 0
    TraverseNext = 1
    TraversePrev = 2
    TraverseHome = 3
    TraverseNextTabGroup = 4
    TraversePrevTabGroup = 5
    TraverseUp = 6
    TraverseDown = 7
    TraverseLeft = 8
    TraverseRight = 9
    TraverseGloballyForward = 10
    TraverseGloballyBackward = 11
  end
  fun add_tab_group = XmAddTabGroup(tab_group : Widget)
  fun remove_tab_group = XmRemoveTabGroup(w : Widget)
  fun is_motif_wm_running = XmIsMotifWMRunning(shell : Widget) : Boolean
  fun tool_tip_get_label = XmToolTipGetLabel(wid : Widget) : Widget
  fun im_register = XmImRegister(w : Widget, reserved : LibC::UInt)
  fun im_unregister = XmImUnregister(w : Widget)
  fun im_set_focus_values = XmImSetFocusValues(w : Widget, args : ArgList, num_args : Cardinal)
  fun im_set_values = XmImSetValues(w : Widget, args : ArgList, num_args : Cardinal)
  fun im_unset_focus = XmImUnsetFocus(w : Widget)
  fun im_get_xim = XmImGetXIM(w : Widget) : Xim
  type Xim = Void*
  fun im_close_xim = XmImCloseXIM(w : Widget)
  fun im_mb_lookup_string = XmImMbLookupString(w : Widget, event : XKeyPressedEvent*, buf : LibC::Char*, nbytes : LibC::Int, keysym : KeySym*, status : LibC::Int*) : LibC::Int
  fun im_va_set_focus_values = XmImVaSetFocusValues(w : Widget, ...)
  fun im_va_set_values = XmImVaSetValues(w : Widget, ...)
  fun im_get_xic = XmImGetXIC(w : Widget, input_policy : InputPolicy, args : ArgList, num_args : Cardinal) : Xic
  alias InputPolicy = UInt8
  fun im_set_xic = XmImSetXIC(w : Widget, input_context : Xic) : Xic
  fun im_free_xic = XmImFreeXIC(w : Widget, input_context : Xic)
  fun im_mb_reset_ic = XmImMbResetIC(w : Widget, mb : LibC::Char**)
  fun im_get_xic_reset_state = XmImGetXICResetState(w : Widget) : XimResetState
  alias XimResetState = LibC::ULong
  IndicatorNone = 0
  IndicatorFill = 1
  IndicatorBox = 255
  IndicatorCheck = 16
  IndicatorCheckBox = 17
  IndicatorCross = 32
  IndicatorCrossBox = 33
  Unset = 0
  Set = 1
  Indeterminate = 2
  ToggleBoolean = 0
  ToggleIndeterminate = 1
  ExternalHighlight = 0
  InternalHighlight = 1
  PathModeFull = 0
  PathModeRelative = 1
  FilterNone = 0
  FilterHiddenFiles = 1
  fun create_push_button = XmCreatePushButton(parent : Widget, name : LibC::Char*, arglist : ArgList, argcount : Cardinal) : Widget
  fun va_create_push_button = XmVaCreatePushButton(parent : Widget, name : LibC::Char*, ...) : Widget
  fun va_create_managed_push_button = XmVaCreateManagedPushButton(parent : Widget, name : LibC::Char*, ...) : Widget
  fun text_set_highlight = XmTextSetHighlight(w : Widget, left : TextPosition, right : TextPosition, mode : HighlightMode)
  alias TextPosition = LibC::Long
  enum HighlightMode
    HighlightNormal = 0
    HighlightSelected = 1
    HighlightSecondarySelected = 2
    SeeDetail = 3
  end
  fun create_scrolled_text = XmCreateScrolledText(parent : Widget, name : LibC::Char*, arglist : ArgList, argcount : Cardinal) : Widget
  fun create_text = XmCreateText(parent : Widget, name : LibC::Char*, arglist : ArgList, argcount : Cardinal) : Widget
  fun va_create_text = XmVaCreateText(parent : Widget, name : LibC::Char*, ...) : Widget
  fun va_create_managed_text = XmVaCreateManagedText(parent : Widget, name : LibC::Char*, ...) : Widget
  fun text_get_substring = XmTextGetSubstring(widget : Widget, start : TextPosition, num_chars : LibC::Int, buf_size : LibC::Int, buffer : LibC::Char*) : LibC::Int
  fun text_get_substring_wcs = XmTextGetSubstringWcs(widget : Widget, start : TextPosition, num_chars : LibC::Int, buf_size : LibC::Int, buffer : WcharT*) : LibC::Int
  alias WcharT = LibC::Int
  fun text_get_string = XmTextGetString(widget : Widget) : LibC::Char*
  fun text_get_string_wcs = XmTextGetStringWcs(widget : Widget) : WcharT*
  fun text_get_last_position = XmTextGetLastPosition(widget : Widget) : TextPosition
  fun text_set_string = XmTextSetString(widget : Widget, value : LibC::Char*)
  fun text_set_string_wcs = XmTextSetStringWcs(widget : Widget, wc_value : WcharT*)
  fun text_replace = XmTextReplace(widget : Widget, frompos : TextPosition, topos : TextPosition, value : LibC::Char*)
  fun text_replace_wcs = XmTextReplaceWcs(widget : Widget, frompos : TextPosition, topos : TextPosition, value : WcharT*)
  fun text_insert = XmTextInsert(widget : Widget, position : TextPosition, value : LibC::Char*)
  fun text_insert_wcs = XmTextInsertWcs(widget : Widget, position : TextPosition, wc_value : WcharT*)
  fun text_set_add_mode = XmTextSetAddMode(widget : Widget, state : Boolean)
  fun text_get_add_mode = XmTextGetAddMode(widget : Widget) : Boolean
  fun text_get_editable = XmTextGetEditable(widget : Widget) : Boolean
  fun text_set_editable = XmTextSetEditable(widget : Widget, editable : Boolean)
  fun text_get_max_length = XmTextGetMaxLength(widget : Widget) : LibC::Int
  fun text_set_max_length = XmTextSetMaxLength(widget : Widget, max_length : LibC::Int)
  fun text_get_top_character = XmTextGetTopCharacter(widget : Widget) : TextPosition
  fun text_set_top_character = XmTextSetTopCharacter(widget : Widget, top_character : TextPosition)
  fun text_get_cursor_position = XmTextGetCursorPosition(widget : Widget) : TextPosition
  fun text_get_insertion_position = XmTextGetInsertionPosition(widget : Widget) : TextPosition
  fun text_set_insertion_position = XmTextSetInsertionPosition(widget : Widget, position : TextPosition)
  fun text_set_cursor_position = XmTextSetCursorPosition(widget : Widget, position : TextPosition)
  fun text_remove = XmTextRemove(widget : Widget) : Boolean
  fun text_copy = XmTextCopy(widget : Widget, copy_time : Time) : Boolean
  fun text_copy_link = XmTextCopyLink(widget : Widget, copy_time : Time) : Boolean
  fun text_cut = XmTextCut(widget : Widget, cut_time : Time) : Boolean
  fun text_paste = XmTextPaste(widget : Widget) : Boolean
  fun text_paste_link = XmTextPasteLink(widget : Widget) : Boolean
  fun text_get_selection = XmTextGetSelection(widget : Widget) : LibC::Char*
  fun text_get_selection_wcs = XmTextGetSelectionWcs(widget : Widget) : WcharT*
  fun text_set_selection = XmTextSetSelection(widget : Widget, first : TextPosition, last : TextPosition, set_time : Time)
  fun text_clear_selection = XmTextClearSelection(widget : Widget, clear_time : Time)
  fun text_get_selection_position = XmTextGetSelectionPosition(widget : Widget, left : TextPosition*, right : TextPosition*) : Boolean
  fun text_xy_to_pos = XmTextXYToPos(widget : Widget, x : Position, y : Position) : TextPosition
  fun text_pos_to_xy = XmTextPosToXY(widget : Widget, position : TextPosition, x : Position*, y : Position*) : Boolean
  fun text_get_source = XmTextGetSource(widget : Widget) : TextSource
  type TextSource = Void*
  fun text_set_source = XmTextSetSource(widget : Widget, source : TextSource, top_character : TextPosition, cursor_position : TextPosition)
  fun text_show_position = XmTextShowPosition(widget : Widget, position : TextPosition)
  fun text_scroll = XmTextScroll(widget : Widget, n : LibC::Int)
  fun text_get_baseline = XmTextGetBaseline(widget : Widget) : LibC::Int
  fun text_get_centerline = XmTextGetCenterline(widget : Widget) : LibC::Int
  fun text_disable_redisplay = XmTextDisableRedisplay(widget : Widget)
  fun text_enable_redisplay = XmTextEnableRedisplay(widget : Widget)
  fun text_find_string = XmTextFindString(w : Widget, start : TextPosition, search_string : LibC::Char*, direction : TextDirection, position : TextPosition*) : Boolean
  enum TextDirection
    TextForward = 0
    TextBackward = 1
  end
  fun text_find_string_wcs = XmTextFindStringWcs(w : Widget, start : TextPosition, wc_string : WcharT*, direction : TextDirection, position : TextPosition*) : Boolean
  fun main_window_set_areas = XmMainWindowSetAreas(w : Widget, menu : Widget, command : Widget, hscroll : Widget, vscroll : Widget, wregion : Widget)
  fun main_window_sep1 = XmMainWindowSep1(w : Widget) : Widget
  fun main_window_sep2 = XmMainWindowSep2(w : Widget) : Widget
  fun main_window_sep3 = XmMainWindowSep3(w : Widget) : Widget
  fun create_main_window = XmCreateMainWindow(parent : Widget, name : LibC::Char*, args : ArgList, arg_count : Cardinal) : Widget
  fun va_create_main_window = XmVaCreateMainWindow(parent : Widget, name : LibC::Char*, ...) : Widget
  fun va_create_managed_main_window = XmVaCreateManagedMainWindow(parent : Widget, name : LibC::Char*, ...) : Widget
  fun create_command = XmCreateCommand(parent : Widget, name : LibC::Char*, al : ArgList, ac : Cardinal) : Widget
  fun va_create_command = XmVaCreateCommand(parent : Widget, name : LibC::Char*, ...) : Widget
  fun va_create_managed_command = XmVaCreateManagedCommand(parent : Widget, name : LibC::Char*, ...) : Widget
  fun command_get_child = XmCommandGetChild(widget : Widget, child : UInt8) : Widget
  fun command_set_value = XmCommandSetValue(widget : Widget, value : LibC::Char*)
  fun command_append_value = XmCommandAppendValue(widget : Widget, value : LibC::Char*)
  fun command_error = XmCommandError(widget : Widget, error : LibC::Char*)
  fun create_command_dialog = XmCreateCommandDialog(ds_p : Widget, name : LibC::Char*, fsb_args : ArgList, fsb_n : Cardinal) : Widget
end

