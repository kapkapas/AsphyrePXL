unit PXL.Providers.DX11;
(*
 * This file is part of Asphyre Framework, also known as Platform eXtended Library (PXL).
 * Copyright (c) 2015 - 2017 Yuriy Kotsarenko. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License is
 * distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 *)
interface

{$INCLUDE PXL.Config.inc}

uses
  PXL.Devices, PXL.Textures, PXL.Canvas, PXL.Providers;

type
  TDX11Provider = class(TGraphicsDeviceProvider)
  public
    function CreateDevice: TCustomDevice; override;
    function CreateCanvas(const Device: TCustomDevice): TCustomCanvas; override;
    function CreateLockableTexture(const Device: TCustomDevice;
      const AutoSubscribe: Boolean): TCustomLockableTexture; override;
    function CreateDrawableTexture(const Device: TCustomDevice;
      const AutoSubscribe: Boolean): TCustomDrawableTexture; override;
  end;

implementation

uses
  PXL.Devices.DX11, PXL.Textures.DX11, PXL.Canvas.DX11;

function TDX11Provider.CreateDevice: TCustomDevice;
begin
  Result := TDX11Device.Create(Self);
end;

function TDX11Provider.CreateCanvas(const Device: TCustomDevice): TCustomCanvas;
begin
  Result := TDX11Canvas.Create(Device);
end;

function TDX11Provider.CreateLockableTexture(const Device: TCustomDevice;
  const AutoSubscribe: Boolean): TCustomLockableTexture;
begin
  Result := TDX11LockableTexture.Create(Device, AutoSubscribe);
end;

function TDX11Provider.CreateDrawableTexture(const Device: TCustomDevice;
  const AutoSubscribe: Boolean): TCustomDrawableTexture;
begin
  Result := TDX11DrawableTexture.Create(Device, AutoSubscribe);
end;

end.
