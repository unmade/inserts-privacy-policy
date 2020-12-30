from starlette.applications import Starlette
from starlette.responses import Response
from starlette.routing import Route

from policy import POLICY_TEXT


async def index(request):
    return Response(POLICY_TEXT, media_type="text/plain")

app = Starlette(debug=False, routes=[
    Route("/", index),
])

