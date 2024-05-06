//
//  GameManager+Connectivity.swift
//  Duiduika
//
//  Created by Wei Lin Weng on 12/5/22.
//

import Foundation
import MultipeerConnectivity

extension GameManager: MCSessionDelegate{
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
            switch state {
            case .connecting:
                print("\(peerId) state: connecting")
            case .connected:
                print("\(peerId) state: connected")
            case .notConnected:
                print("\(peerId) state: not connected")
            @unknown default:
                print("\(peerId) state: unknown error")
            }
        }
        
        func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
            
        }
        
        func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
            
        }
        
        func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
            
        }
        
        func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
            
        }
    }
