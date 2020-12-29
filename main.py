from starlette.applications import Starlette
from starlette.responses import Response
from starlette.routing import Route


async def index(request):
    return Response("Hello, World", media_type="text/plain")

app = Starlette(debug=False, routes=[
    Route("/", index),
])

