defmodule TipApps.FilterIn do
    @moduledoc """
        Header와 Token 사이의 내용을 삭제 한다.
    """

    require Logger


    @doc """
        str 에서 head 앞의 부분을 가져온다.
    """
    def getFront(str,head) do
        case String.split(str, head, parts: 2) do
            [_, remain] -> remain
            [_] -> ""
        end
    end

    def getContent(str,tail) do
        case String.split(str, tail, parts: 2) do
            [_] -> ""
            [content, remain] -> {content, remain}
        end
    end

    def filterIn("",_head,_tail) do
        ""
    end

    def filterIn(str,head,tail) do
        remain = getFront(str,head)
        case String.split(remain, tail, parts: 2) do
            [_]->""
            [content, remain]-> content <> filterIn(remain,head,tail)
        end
    end

    def test do
        IO.puts filterIn("abc()"  , "(" , ")"     )
        IO.puts filterIn("()abc"  , "(" , ")"      )
        IO.puts filterIn("abc()abc()"  , "(" , ")" )
        IO.puts filterIn("abc()abc()abc"  , "(" , ")" )
        IO.puts filterIn("abc(abc)abc()abc"  , "(" , ")" )
        IO.puts filterIn("abc(abc"  , "(" , ")" )
        IO.puts filterIn("abc(abc()"  , "(" , ")" )
        IO.puts filterIn("abc(ab)"  , "(" , ")" )
        IO.puts filterIn("abc(ab)(abcc)ab"  , "(" , ")" )
        IO.puts filterIn("(abc)(abab)(ab"  , "(" , ")" )
    end

end
