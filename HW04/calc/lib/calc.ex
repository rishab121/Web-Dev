defmodule Calc do
  @moduledoc """
  Documentation for Calc.
  """

  @doc """

  """
  #;; Atrribution for regex = www.stackoverflow.com, www.regex101.com
  #;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  def managediv(expression) do
    divexpression = Regex.run(~r/\d+\/\d+/,expression) 
    if(divexpression == nil) do
      expression
    else
      managedivhelper(expression)
      |> managediv()
    end
  end

  def managedivhelper(expression) do
    divexpression = Regex.run(~r/\d+\/\d+/,expression)
    divexpression = hd divexpression
    divexpression = String.split(divexpression,"/")
    first_number = hd divexpression
    second_number = hd tl divexpression
    answer = Integer.to_string(eval(first_number,second_number,:div))
    expression = Regex.replace(~r/\d+\/\d+/,expression,answer,global: false)
    expression
  end
  #;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  def managemul(expression) do
    mulexpression = Regex.run(~r/\d+\*\d+/,expression)
    if (mulexpression == nil) do
      expression
    else
      managemulhelper(expression)
      |> managemul()
    end
  end


  def managemulhelper(expression) do
    mulexpression = Regex.run(~r/\d+\*\d+/,expression)
    mulexpression = hd mulexpression
    mulexpression = String.split(mulexpression,"*")
    first_number = hd mulexpression
    second_number = hd tl mulexpression
    answer = Integer.to_string(eval(first_number,second_number,:mul))
    expression = Regex.replace(~r/\d+\*\d+/,expression,answer,global: false)
    expression

  end

  #;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  def managesub(expression) do
    subexpression = Regex.run(~r/\d+\-\d+/,expression)
    if (subexpression == nil) do
      expression
    else
      managesubhelper(expression)
      |> managesub()
    end
  end

  def managesubhelper(expression) do
    subexpression = Regex.run(~r/\d+\-\d+/,expression)
    subexpression = hd subexpression
    subexpression = String.split(subexpression,"-")
    first_number = hd subexpression
    second_number = hd tl subexpression
    answer = Integer.to_string(eval(first_number,second_number,:sub))
    expression = Regex.replace(~r/\d+\-\d+/,expression,answer,global: false)
    solvingminuses = Regex.run(~r/\d+\+\-\d+/,expression) #handle +-
    if solvingminuses != nil do
      Regex.replace(~r/\+\-/,expression,"-")
      |> managesub()
    else
      expression
    end
  end
  #;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  def manageadd(expression) do
    addexpression = Regex.run(~r/\d+\+\d+/,expression)
    if (addexpression == nil) do
      expression
    else
      manageaddhelper(expression)
      |> manageadd()
    end  
  end

  def manageaddhelper(expression) do
    addexpression = Regex.run(~r/\d+\+\d+/,expression)
    addexpression = hd addexpression
    addexpression = String.split(addexpression,"+")
    first_number = hd addexpression
    second_number = hd tl addexpression
    answer = Integer.to_string(eval(first_number,second_number,:add))
    expression = Regex.replace(~r/\d+\+\d+/,expression,answer,global: false)
    expression
  end
  #;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  def managebraces(expression) do
    braceexpression = Regex.run(~r/\(([^)]*)\)/, expression)
    if (braceexpression == nil) do
      expression
    else
      managebraceshelper(expression)
      |> managebraces()
    end
    
  end

  def managebraceshelper(expression) do
    braceexpression = Regex.run(~r/\(([^)]*)\)/, expression)
    braceexpression = hd tl braceexpression
    braceexpression = managediv(braceexpression) |> managemul() |> managesub() |> manageadd()
    expression = Regex.replace(~r/\(([^)]*)\)/, expression,braceexpression,global: false)
    expression  
  end

  #;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  def eval(x,y,:add) do
    {x,_} = Integer.parse(x)
    {y,_} = Integer.parse(y)
    x + y
  end

  def eval(x,y,:sub) do
    {x,_} = Integer.parse(x)
    {y,_} = Integer.parse(y)
    x - y
  end

  def eval(x,y,:mul) do
    {x,_} = Integer.parse(x)
    {y,_} = Integer.parse(y)  
    x * y
  end

  def eval(x,y,:div) do
    {x,_} = Integer.parse(x)
    {y,_} = Integer.parse(y)  
    Integer.floor_div(x,y)
  end

  def eval(expression) do
    expression = Regex.replace(~r/\s/,expression,"") #remove spaces
    expression = managebraces(expression) |> managediv() |> managemul() |> managesub() |> manageadd()
    solvingminuses = Regex.run(~r/\d+\+\-\d+/,expression) #handle +-
    if solvingminuses != nil do
      Regex.replace(~r/\+\-/,expression,"-")
      |> managesub()
    else
      expression
    end 
   

  end

  def main() do
    
    IO.gets("")
    |> String.trim()
    |> eval()
    |> IO.puts()
    main()
  end

end
