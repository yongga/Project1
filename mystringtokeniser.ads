with Ada.Characters.Latin_1;

package MyStringTokeniser with SPARK_Mode is

   type TokenExtent is record -- "Struct in C" where variables can contain different types
      Start : Positive;
      Length : Natural;
   end record;

   type TokenArray is array(Positive range <>) of TokenExtent; -- "Box notation" implies unbounded positive integer

   function Is_Whitespace(Ch : Character) return Boolean is -- returns true if space is found, otherwise false
     (Ch = ' ' or Ch = Ada.Characters.Latin_1.LF or
        Ch = Ada.Characters.Latin_1.HT);

   procedure Tokenise(S : in String; Tokens : in out TokenArray; Count : out Natural) with
     Pre => (if S'Length > 0 then S'First <= S'Last) and Tokens'First <= Tokens'Last,

   -- What: This criteria means that the number of tokens found cannot be more than the length of the Token (remember Token had a max range of 5 in our example)
   -- Why: This is important because if the number of tokens found were more than the length of the Token, this means that the implementation is incorrect.
     Post => Count <= Tokens'Length and

     -- What: This is essentially looping through all the tokens found and checking every tokens meet certain conditions (will be explained below)
     -- Why: This is important because after executing this function, we still want to ensure that the token did not violate any properties to ensure its correctness
     (for all Index in Tokens'First..Tokens'First+(Count-1) =>

        -- What: This criteria means that every token must at least begin at the minimal index of the original string
        -- Why: This is important to ensure that we do not access any index that is not within our specified bound
        (Tokens(Index).Start >= S'First and --

         -- What: This criteria is to ensure that every token must have at least one character
         -- Why: This is important because we dont wish to have an empty string as a valid token
           Tokens(Index).Length > 0) and then

        -- What: This is a little interesting but this simply means that for all the tokens found, every tokens would obey this algorithmic description, up till the last token in the string
        -- Why: If there are tokens that does not follow this property, this means that we have incorrectly identified a token as valid, even though the token should be an invalid one
            Tokens(Index).Length-1 <= S'Last - Tokens(Index).Start);


end MyStringTokeniser;
