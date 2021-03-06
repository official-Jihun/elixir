defmodule TipApps.FilterInNested do
    @moduledoc """
        Header와 Token 사이의 내용을 가져오고, nested라면 가장 안에 있는 구문을 가져온다.
        이렇게 디자인 하려고 했는데, 크게 의미없는것 같습니다.
    """

    require Logger


    @doc """
        str 에서 head 앞의 부분을 가져온다.
    """
    def getFront(str,head) do
        case String.split(str, head, parts: 2) do
            [_, remain] -> getFront(remain, head)
            [content] -> content
        end
    end


    def filterIn("",_head,_tail) do
        ""
    end

    def filterIn(str,head,tail) do
        if(String.contains?(str, [head,tail])) do
            context = getFront(str,head)
            case String.split(context, tail, parts: 2) do
                [content, remain]-> IO.puts([content, remain, head, tail])
                    #content <> filterIn(remain,head,tail)
                [content]->content
            end
        end
    end

    def test do
        #IO.puts filterIn("abc()"  , "(" , ")"     )
        IO.puts filterIn("()abc"  , "(" , ")"      )

    end

end
