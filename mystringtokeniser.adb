
package body MyStringTokeniser with SPARK_Mode is



   procedure Tokenise(S : in String; Tokens : in out TokenArray; Count : out Natural) is
      Index : Positive; -- Index of original string
      Extent : TokenExtent; -- Token instance that contains two attributes : Start and Length
      OutIndex : Integer := Tokens'First;
   begin
      Count := 0; -- Variable to be returned
      if (S'First > S'Last) then --
         return;
      end if;
      Index := S'First;
      while OutIndex <= Tokens'Last and Index <= S'Last and Count < Tokens'Length loop -- Comparing 3 things: 1) Token must be within 1..5, 2) Index of original string must not exceed length of original string, 3) Count tokens must not exceed 5
         pragma Loop_Invariant
           (for all J in Tokens'First..OutIndex-1 =>
              (Tokens(J).Start >= S'First and
                   Tokens(J).Length > 0) and then -- should have at least 1 token
            Tokens(J).Length-1 <= S'Last - Tokens(J).Start); -- criteria for a valid token

         -- What: This loop_invariant is essentially ensuring that overflows will not occur, and we will not be accessing any out of ranged index.
         -- Why: 1) The TokenArray is an unbounded positive integer, this means that if we input a string with more than an integer length of tokens, then the value for OutIndex will overflow because Token'Last has not been satisfied yet
         -- 2)From the above scenario, once the OutIndex overflows, the value of OutIndex will be treated as 0 as described in the stringtointeger.adb file. Thus, the following code Tokens(OutIndex) := Extent; will cause an array out of bounds error

         pragma Loop_Invariant (OutIndex = Tokens'First + Count); -- number of tokens = 1 (minimum range of Token) + count at every loop

         -- look for start of next token
         while (Index >= S'First and Index < S'Last) and then Is_Whitespace(S(Index)) loop -- Original index is >= 1 and < last index, and it is a white spaee character
            Index := Index + 1;
         end loop;
         if (Index >= S'First and Index <= S'Last) and then not Is_Whitespace(S(Index)) then -- Original index is >= 1 and <= last index, and it is NOT a white space character
            -- found a token
            Extent.Start := Index; -- Index is a positive number
            Extent.Length := 0; -- Determine length of current token

            -- look for end of this token
            while Positive'Last - Extent.Length >= Index and then (Index+Extent.Length >= S'First and Index+Extent.Length <= S'Last) and then not Is_Whitespace(S(Index+Extent.Length)) loop
               Extent.Length := Extent.Length + 1;
            end loop;

            Tokens(OutIndex) := Extent;
            Count := Count + 1; -- found a token

            -- check for last possible token, avoids overflow when incrementing OutIndex
            if (OutIndex = Tokens'Last) then -- check the number of tokens found exceeded the allowance range
               return;
            else
               OutIndex := OutIndex + 1; -- if still within range, increment number of tokens found
            end if;

            -- check for end of string, avoids overflow when incrementing Index
            if S'Last - Extent.Length < Index then -- found the last token available
               return;
            else
               Index := Index + Extent.Length; -- may contain another token
            end if;
         end if;
      end loop;
   end Tokenise;

end MyStringTokeniser;
