import os
import json
from typing import Optional
from pathlib import Path
import requests
from pydantic import BaseModel, parse_obj_as
from datetime import datetime
from zoneinfo import ZoneInfo

OUTPUT_PATH = Path(os.environ['OUTPUT_PATH'])
JST = ZoneInfo('Asia/Tokyo')

class Meta(BaseModel):
  status: int

class Live(BaseModel):
  id: str
  title: str
  status: str
  user_id: int
  started_at: datetime

class Data(BaseModel):
  live: Live

class ApiResponse(BaseModel):
  meta: Meta
  data: Optional[Data]

headers = {
  'User-Agent': 'api.aoirint.com update_niconico_live/0.1.0',
}

community_id = '5633084'
url = f'https://com.nicovideo.jp/api/v1/communities/{community_id}/lives/onair.json'

res = requests.get(url, headers=headers)
data = res.json()

response = parse_obj_as(ApiResponse, data)

if response.meta.status == 200:
  OUTPUT_PATH.write_text(json.dumps({
    'title': response.data.live.title,
    'url': f'https://live.nicovideo.jp/watch/{response.data.live.id}',
    'status': 'on_air',
    'started_at': response.data.live.started_at.astimezone(JST).isoformat(),
    'ended_at': None,
  }, ensure_ascii=False), encoding='utf-8')
else:
  OUTPUT_PATH.unlink(missing_ok=True)
