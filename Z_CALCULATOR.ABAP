*&---------------------------------------------------------------------*
*& Report Z_CALCULATOR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_calculator.

"This program simulates a calculator


"input area for user informs the values
PARAMETERS: p_input1 TYPE i,
            p_input2 TYPE i.

DATA: lv_result TYPE i,
      flag      TYPE i VALUE 0.

"Creating buttons using SELECTION-SCREEN
SELECTION-SCREEN: BEGIN OF SCREEN 500 TITLE TEXT-001,

                  SKIP,
                  PUSHBUTTON 10(10) add   USER-COMMAND add1, "When user interacts, the command add1 will run
                  PUSHBUTTON 25(11) sub   USER-COMMAND sub,
                  PUSHBUTTON 40(15) mult  USER-COMMAND mult,
                  PUSHBUTTON 60(10) div   USER-COMMAND div,
END OF SCREEN 500.

INITIALIZATION. "Initializing the buttons created above

  add   = 'Addition'.
  sub   = 'Subtraction'.
  mult  = 'Multiplication'.
  div   = 'Division'.

AT SELECTION-SCREEN.

  CASE sy-ucomm. "if user interacts
    WHEN 'ADD1'.
      flag = 1.
      lv_result = p_input1 + p_input2.

    WHEN 'SUB'.
      flag = 1.
      lv_result = p_input1 - p_input2.

    WHEN 'MULT'.
      flag = 1.
      lv_result = p_input1 * p_input2.

    WHEN 'DIV'.
      IF p_input2 <> 0.
        flag = 1.
        lv_result = p_input1 / p_input2.

      ELSE.
        flag = 2.

      ENDIF.

  ENDCASE.


START-OF-SELECTION. "Shows the output

  IF p_input1 IS NOT INITIAL AND p_input2 IS NOT INITIAL.

    CALL SELECTION-SCREEN 500 STARTING AT 10 10.

    IF flag = 1.
      WRITE: lv_result.

    ELSEIF flag = 2.
      WRITE: 'Cannot divide a number by ZERO'.

    ELSEIF flag = 0.
      MESSAGE 'Press any button to perform an operation' TYPE 'I'.

    ENDIF.

  ELSE.
    MESSAGE 'Please inform values on both fields' TYPE 'I'.

  ENDIF.
