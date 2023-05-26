program backend;

{$APPTYPE CONSOLE}

{$R *.res}

uses Horse, Horse.Jhonson, System.JSON, System.SysUtils;


begin
  // It's necessary to add the middleware in the Horse:
  THorse.Use(Jhonson());

  // You can specify the charset when adding middleware to the Horse:
  // THorse.Use(Jhonson('UTF-8'));

  THorse.Post('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LBody: TJSONObject;
    begin
      // Req.Body gives access to the content of the request in string format.
      // Using jhonson middleware, we can get the content of the request in JSON format.

      Writeln('Request POST /ping');
      LBody := Req.Body<TJSONObject>;
      Res.Send<TJSONObject>(LBody);
    end);

  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Writeln('Request GET /ping');
      Res.Send('<h1>pong</h1>');
    end);

  THorse.Get('/cliente',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      clientes: TJSONArray;

    begin
      try
        clientes := TJSONArray.Create;
        clientes.Add(TJSONObject.Create(TJSONPair.Create('nome', 'Wagner Cardoso')));
        clientes.Add(TJSONObject.Create(TJSONPair.Create('nome', 'Silna Batinga')));
        clientes.Add(TJSONObject.Create(TJSONPair.Create('nome', 'Ilna Batinga')));
        clientes.Add(TJSONObject.Create(TJSONPair.Create('nome', 'Saulo Batinga Cardoso')));


        Writeln('Request GET /cliente');
        Res.Send<TJSONArray>(clientes);
      except on ex:exception do

      end;
    end);

  THorse.Listen(9000, procedure(Horse: THorse)
    begin
      Writeln('Servidor ouvindo na porta: ' + Horse.Port.ToString);
    end);
end.
