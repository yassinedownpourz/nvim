local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node

vim.keymap.set({ "i", "s" }, "<A-n>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set({ "i", "s" }, "<A-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- PHP and Laravel snippets
ls.add_snippets("php", {
  s(
    "fun",
    fmt(
      [[
public function {name}({args}): {return_type} {{
    {body}
}}
    ]],
      {
        name = i(1, "functionName"),
        args = i(2, "$param1, $param2"),
        return_type = i(3, "void"),
        body = i(4, "// Your code here"),
      }
    )
  ),

  -- Anonymous Function
  s(
    "anonfn",
    fmt(
      [[
function({args}) use ({use_vars}) {{
    {body}
}};
    ]],
      {
        args = i(1, "$param1, $param2"),
        use_vars = i(2, "$var1, $var2"),
        body = i(3, "// Your code here"),
      }
    )
  ),

  -- Arrow Function
  s(
    "fn",
    fmt(
      [[
fn({args}) => {expression};
    ]],
      {
        args = i(1, "$param1, $param2"),
        expression = i(2, "$param1 + $param2"),
      }
    )
  ),

  -- Laravel Route snippet
  s(
    "route",
    fmt(
      [[
Route::{method}('{uri}', [{controller}::class, '{method_name}']);
    ]],
      {
        method = c(1, { t "get", t "post", t "put", t "delete", t "patch" }),
        uri = i(2, "uri"),
        controller = i(3, "ControllerName"),
        method_name = i(4, "method"),
      }
    )
  ),

  -- Eloquent model function snippet
  s(
    "model",
    fmt(
      [[
class {ModelName} extends Model {{
    protected $fillable = [
        {fillable_fields}
    ];

    public function {relation_name}() {{
        return $this->{relation_type}({RelatedModel}::class);
    }}
}}
    ]],
      {
        ModelName = i(1, "ModelName"),
        fillable_fields = i(2, "'field1', 'field2'"),
        relation_name = i(3, "relationName"),
        relation_type = c(4, { t "hasOne", t "hasMany", t "belongsTo", t "belongsToMany" }),
        RelatedModel = i(5, "RelatedModel"),
      }
    )
  ),

  -- Blade Component snippet
  s(
    "blade",
    fmt(
      [[
<x-{component} :{props}="{value}" />
    ]],
      {
        component = i(1, "component-name"),
        props = i(2, "propName"),
        value = i(3, "value"),
      }
    )
  ),

  -- Migration snippet
  s(
    "migration",
    fmt(
      [[
Schema::{method}('{table}', function (Blueprint $table) {{
    $table->id();
    {fields}
    $table->timestamps();
}});
    ]],
      {
        method = c(1, { t "create", t "table" }),
        table = i(2, "table_name"),
        fields = i(3, "$table->string('name');"),
      }
    )
  ),

  -- Laravel Controller Method
  s(
    "controller",
    fmt(
      [[
public function {method}(Request ${request}) {{
    {logic}
}}
    ]],
      {
        method = i(1, "methodName"),
        request = i(2, "request"),
        logic = i(3, "// Your logic here"),
      }
    )
  ),
})
