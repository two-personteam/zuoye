package com.itshidu.websocket.server;

import java.net.Socket;
import java.nio.channels.SelectionKey;
import java.nio.channels.SocketChannel;
import java.util.List;

import com.itshidu.websocket.WebSocketAdapter;
import com.itshidu.websocket.WebSocketImpl;
import com.itshidu.websocket.drafts.Draft;
import com.itshidu.websocket.server.WebSocketServer.WebSocketServerFactory;

public class DefaultWebSocketServerFactory implements WebSocketServerFactory {
	
	public WebSocketImpl createWebSocket( WebSocketAdapter a, Draft d, Socket s ) {
		return new WebSocketImpl( a, d );
	}
	
	public WebSocketImpl createWebSocket( WebSocketAdapter a, List<Draft> d, Socket s ) {
		return new WebSocketImpl( a, d );
	}
	
	public SocketChannel wrapChannel( SocketChannel channel, SelectionKey key ) {
		return channel;
	}
	
	public void close() {
	}
}