/* Generated By:JavaCC: Do not edit this line. IsAriExp.java */
    import java.io.PrintStream ;
    class IsAriExp implements IsAriExpConstants {
        public static void main( String[] args )
            throws ParseException, TokenMgrError, NumberFormatException {
            IsAriExp parser = new IsAriExp( System.in ) ;
            parser.Start( System.out ) ;
        }

//PROCEDURE MAIN
  final public void Start(PrintStream printStream) throws ParseException, NumberFormatException {
    label_1:
    while (true) {
      switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
      case PROGRAM:
        ;
        break;
      default:
        jj_la1[0] = jj_gen;
        break label_1;
      }
      S();
          printStream.println( "TRUE" ) ;
    }
    jj_consume_token(0);
  }

//PROCEDURE S
  final public void S() throws ParseException, NumberFormatException {
    jj_consume_token(PROGRAM);
    jj_consume_token(ID);
    A();
  }

//PROCEDURE A
  final public void A() throws ParseException, NumberFormatException {
    B();
    C();
  }

//PROCEDURE B
  final public void B() throws ParseException, NumberFormatException {
    jj_consume_token(VAR);
    D();
    jj_consume_token(COLON);
    E();
    jj_consume_token(SEMI);
  }

//PROCEDURE D
  final public void D() throws ParseException, NumberFormatException {
    jj_consume_token(ID);
    D1();
  }

//PROCEDURE D1
  final public void D1() throws ParseException, NumberFormatException {
    switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
    case COMMA:
      jj_consume_token(COMMA);
      D();
      break;
    default:
      jj_la1[1] = jj_gen;
      ;
    }
  }

//PROCEDURE E
  final public void E() throws ParseException, NumberFormatException {
    switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
    case INTEGER:
      jj_consume_token(INTEGER);
      break;
    case REAL:
      jj_consume_token(REAL);
      break;
    case CHAR:
      jj_consume_token(CHAR);
      break;
    default:
      jj_la1[2] = jj_gen;
      jj_consume_token(-1);
      throw new ParseException();
    }
  }

//PROCEDURE C
  final public void C() throws ParseException, NumberFormatException {
    jj_consume_token(BEGIN);
    F();
    jj_consume_token(END);
  }

//PROCEDURE F
  final public void F() throws ParseException, NumberFormatException {
    G();
    F1();
  }

//PROCEDURE F1
  final public void F1() throws ParseException, NumberFormatException {
    switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
    case SEMI:
      jj_consume_token(SEMI);
      G();
      break;
    default:
      jj_la1[3] = jj_gen;
      ;
    }
  }

//PROCEDURE G
  final public void G() throws ParseException, NumberFormatException {
    jj_consume_token(ID);
    jj_consume_token(ASSIGN);
    H();
  }

//PROCEDURE H
  final public void H() throws ParseException, NumberFormatException {
    I();
    H1();
  }

// PROCEDURE H1
  final public void H1() throws ParseException, NumberFormatException {
    switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
    case ADD:
    case DEC:
      switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
      case ADD:
        jj_consume_token(ADD);
        I();
        H1();
        break;
      case DEC:
        jj_consume_token(DEC);
        I();
        H1();
        break;
      default:
        jj_la1[4] = jj_gen;
        jj_consume_token(-1);
        throw new ParseException();
      }
      break;
    default:
      jj_la1[5] = jj_gen;
      ;
    }
  }

//PROCEDURE I
  final public void I() throws ParseException, NumberFormatException {
    J();
    I1();
  }

// PROCEDURE I1
  final public void I1() throws ParseException, NumberFormatException {
    switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
    case MUL:
    case DIV:
      switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
      case MUL:
        jj_consume_token(MUL);
        J();
        I1();
        break;
      case DIV:
        jj_consume_token(DIV);
        J();
        I1();
        break;
      default:
        jj_la1[6] = jj_gen;
        jj_consume_token(-1);
        throw new ParseException();
      }
      break;
    default:
      jj_la1[7] = jj_gen;
      ;
    }
  }

// PROCEDURE J
  final public void J() throws ParseException, NumberFormatException {
    switch ((jj_ntk==-1)?jj_ntk():jj_ntk) {
    case ID:
      jj_consume_token(ID);
      break;
    case NUMBER:
      jj_consume_token(NUMBER);
      break;
    case LB:
      jj_consume_token(LB);
      H();
      jj_consume_token(RB);
      break;
    default:
      jj_la1[8] = jj_gen;
      jj_consume_token(-1);
      throw new ParseException();
    }
  }

  /** Generated Token Manager. */
  public IsAriExpTokenManager token_source;
  SimpleCharStream jj_input_stream;
  /** Current token. */
  public Token token;
  /** Next token. */
  public Token jj_nt;
  private int jj_ntk;
  private int jj_gen;
  final private int[] jj_la1 = new int[9];
  static private int[] jj_la1_0;
  static {
      jj_la1_init_0();
   }
   private static void jj_la1_init_0() {
      jj_la1_0 = new int[] {0x20,0x1000,0x380,0x4000,0x30000,0x30000,0xc0000,0xc0000,0x1900000,};
   }

  /** Constructor with InputStream. */
  public IsAriExp(java.io.InputStream stream) {
     this(stream, null);
  }
  /** Constructor with InputStream and supplied encoding */
  public IsAriExp(java.io.InputStream stream, String encoding) {
    try { jj_input_stream = new SimpleCharStream(stream, encoding, 1, 1); } catch(java.io.UnsupportedEncodingException e) { throw new RuntimeException(e); }
    token_source = new IsAriExpTokenManager(jj_input_stream);
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 9; i++) jj_la1[i] = -1;
  }

  /** Reinitialise. */
  public void ReInit(java.io.InputStream stream) {
     ReInit(stream, null);
  }
  /** Reinitialise. */
  public void ReInit(java.io.InputStream stream, String encoding) {
    try { jj_input_stream.ReInit(stream, encoding, 1, 1); } catch(java.io.UnsupportedEncodingException e) { throw new RuntimeException(e); }
    token_source.ReInit(jj_input_stream);
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 9; i++) jj_la1[i] = -1;
  }

  /** Constructor. */
  public IsAriExp(java.io.Reader stream) {
    jj_input_stream = new SimpleCharStream(stream, 1, 1);
    token_source = new IsAriExpTokenManager(jj_input_stream);
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 9; i++) jj_la1[i] = -1;
  }

  /** Reinitialise. */
  public void ReInit(java.io.Reader stream) {
    jj_input_stream.ReInit(stream, 1, 1);
    token_source.ReInit(jj_input_stream);
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 9; i++) jj_la1[i] = -1;
  }

  /** Constructor with generated Token Manager. */
  public IsAriExp(IsAriExpTokenManager tm) {
    token_source = tm;
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 9; i++) jj_la1[i] = -1;
  }

  /** Reinitialise. */
  public void ReInit(IsAriExpTokenManager tm) {
    token_source = tm;
    token = new Token();
    jj_ntk = -1;
    jj_gen = 0;
    for (int i = 0; i < 9; i++) jj_la1[i] = -1;
  }

  private Token jj_consume_token(int kind) throws ParseException {
    Token oldToken;
    if ((oldToken = token).next != null) token = token.next;
    else token = token.next = token_source.getNextToken();
    jj_ntk = -1;
    if (token.kind == kind) {
      jj_gen++;
      return token;
    }
    token = oldToken;
    jj_kind = kind;
    throw generateParseException();
  }


/** Get the next Token. */
  final public Token getNextToken() {
    if (token.next != null) token = token.next;
    else token = token.next = token_source.getNextToken();
    jj_ntk = -1;
    jj_gen++;
    return token;
  }

/** Get the specific Token. */
  final public Token getToken(int index) {
    Token t = token;
    for (int i = 0; i < index; i++) {
      if (t.next != null) t = t.next;
      else t = t.next = token_source.getNextToken();
    }
    return t;
  }

  private int jj_ntk() {
    if ((jj_nt=token.next) == null)
      return (jj_ntk = (token.next=token_source.getNextToken()).kind);
    else
      return (jj_ntk = jj_nt.kind);
  }

  private java.util.List<int[]> jj_expentries = new java.util.ArrayList<int[]>();
  private int[] jj_expentry;
  private int jj_kind = -1;

  /** Generate ParseException. */
  public ParseException generateParseException() {
    jj_expentries.clear();
    boolean[] la1tokens = new boolean[27];
    if (jj_kind >= 0) {
      la1tokens[jj_kind] = true;
      jj_kind = -1;
    }
    for (int i = 0; i < 9; i++) {
      if (jj_la1[i] == jj_gen) {
        for (int j = 0; j < 32; j++) {
          if ((jj_la1_0[i] & (1<<j)) != 0) {
            la1tokens[j] = true;
          }
        }
      }
    }
    for (int i = 0; i < 27; i++) {
      if (la1tokens[i]) {
        jj_expentry = new int[1];
        jj_expentry[0] = i;
        jj_expentries.add(jj_expentry);
      }
    }
    int[][] exptokseq = new int[jj_expentries.size()][];
    for (int i = 0; i < jj_expentries.size(); i++) {
      exptokseq[i] = jj_expentries.get(i);
    }
    return new ParseException(token, exptokseq, tokenImage);
  }

  /** Enable tracing. */
  final public void enable_tracing() {
  }

  /** Disable tracing. */
  final public void disable_tracing() {
  }

    }