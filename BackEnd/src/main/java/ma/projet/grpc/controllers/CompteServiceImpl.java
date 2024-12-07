package ma.projet.grpc.controllers;

import io.grpc.Status;
import io.grpc.stub.StreamObserver;
import ma.projet.grpc.stubs.*;
import ma.projet.grpc.services.CompteService;
import net.devh.boot.grpc.server.service.GrpcService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.List;

@GrpcService
public class CompteServiceImpl extends CompteServiceGrpc.CompteServiceImplBase {

    @Autowired
    private CompteService compteService;

    @Override
    public void allComptes(GetAllComptesRequest request, StreamObserver<GetAllComptesResponse> responseObserver) {
        try {
            System.out.println("=== Début getAllComptes ===");
            GetAllComptesResponse.Builder responseBuilder = GetAllComptesResponse.newBuilder();
            List<ma.projet.grpc.entities.Compte> comptesEntities = compteService.getAllComptes();
            
            comptesEntities.forEach(compteEntity -> {
                ma.projet.grpc.stubs.Compte compte = ma.projet.grpc.stubs.Compte.newBuilder()
                        .setId(compteEntity.getId())
                        .setSolde((float) compteEntity.getSolde())
                        .setDateCreation(compteEntity.getDateCreation())
                        .setType(ma.projet.grpc.stubs.TypeCompte.valueOf(compteEntity.getType().name()))
                        .build();
                responseBuilder.addComptes(compte);
            });

            System.out.println("Nombre de comptes récupérés: " + comptesEntities.size());
            System.out.println("Status: OK");
            
            responseObserver.onNext(responseBuilder.build());
            responseObserver.onCompleted();
        } catch (Exception e) {
            System.err.println("Erreur: " + e.getMessage());
            responseObserver.onError(
                Status.INTERNAL
                    .withDescription("Erreur interne lors de la récupération des comptes")
                    .withCause(e)
                    .asRuntimeException()
            );
        }
    }

    @Override
    public void compteById(GetCompteByIdRequest request, StreamObserver<GetCompteByIdResponse> responseObserver) {
        ma.projet.grpc.entities.Compte compteEntity = compteService.getCompteById(request.getId());
        
        if (compteEntity != null) {
            Compte compte = Compte.newBuilder()
                    .setId(compteEntity.getId())
                    .setSolde((float) compteEntity.getSolde())
                    .setDateCreation(compteEntity.getDateCreation())
                    .setType(TypeCompte.valueOf(compteEntity.getType().name()))
                    .build();
                    
            responseObserver.onNext(GetCompteByIdResponse.newBuilder().setCompte(compte).build());
        } else {
            responseObserver.onError(new RuntimeException("Compte non trouvé"));
        }
        responseObserver.onCompleted();
    }

    @Override
    public void totalSolde(GetTotalSoldeRequest request, StreamObserver<GetTotalSoldeResponse> responseObserver) {
        double totalSolde = compteService.getTotalSolde();
        int count = (int) compteService.getAllComptes().size();
        double average = count > 0 ? totalSolde / count : 0;

        SoldeStats stats = SoldeStats.newBuilder()
                .setCount(count)
                .setSum((float) totalSolde)
                .setAverage((float) average)
                .build();

        responseObserver.onNext(GetTotalSoldeResponse.newBuilder().setStats(stats).build());
        responseObserver.onCompleted();
    }

    @Override
    public void saveCompte(SaveCompteRequest request, StreamObserver<SaveCompteResponse> responseObserver) {
        try {
            System.out.println("=== Début saveCompte ===");
            CompteRequest compteReq = request.getCompte();
            
            if (compteReq == null) {
                responseObserver.onError(
                    Status.INVALID_ARGUMENT
                        .withDescription("Le compte ne peut pas être null")
                        .asRuntimeException()
                );
                return;
            }

            ma.projet.grpc.entities.Compte compteEntity = new ma.projet.grpc.entities.Compte();
            compteEntity.setSolde((double) compteReq.getSolde());
            compteEntity.setDateCreation(compteReq.getDateCreation());
            compteEntity.setType(ma.projet.grpc.entities.TypeCompte.valueOf(compteReq.getType().name()));
            
            compteEntity = compteService.saveCompte(compteEntity);
            
            Compte compteResponse = Compte.newBuilder()
                    .setId(compteEntity.getId())
                    .setSolde((float) compteEntity.getSolde())
                    .setDateCreation(compteEntity.getDateCreation())
                    .setType(TypeCompte.valueOf(compteEntity.getType().name()))
                    .build();

            System.out.println("Compte sauvegardé avec ID: " + compteEntity.getId());
            System.out.println("Status: OK");
            
            responseObserver.onNext(SaveCompteResponse.newBuilder().setCompte(compteResponse).build());
            responseObserver.onCompleted();
        } catch (Exception e) {
            System.err.println("Erreur: " + e.getMessage());
            responseObserver.onError(
                Status.INTERNAL
                    .withDescription("Erreur lors de la sauvegarde du compte")
                    .withCause(e)
                    .asRuntimeException()
            );
        }
    }

    @Override
    public void comptesByType(GetComptesByTypeRequest request, StreamObserver<GetComptesByTypeResponse> responseObserver) {
        ma.projet.grpc.entities.TypeCompte typeCompte = 
            ma.projet.grpc.entities.TypeCompte.valueOf(request.getType().name());
        
        List<ma.projet.grpc.entities.Compte> comptes = compteService.getComptesByType(typeCompte);
        
        GetComptesByTypeResponse.Builder responseBuilder = GetComptesByTypeResponse.newBuilder();
        
        comptes.forEach(compteEntity -> {
            Compte compte = Compte.newBuilder()
                    .setId(compteEntity.getId())
                    .setSolde((float) compteEntity.getSolde())
                    .setDateCreation(compteEntity.getDateCreation())
                    .setType(TypeCompte.valueOf(compteEntity.getType().name()))
                    .build();
            responseBuilder.addComptes(compte);
        });
        
        responseObserver.onNext(responseBuilder.build());
        responseObserver.onCompleted();
    }

    @Override
    public void deleteCompte(DeleteCompteRequest request, StreamObserver<DeleteCompteResponse> responseObserver) {
        String id = request.getId();
        boolean deleted = compteService.deleteCompte(id);
        
        DeleteCompteResponse response = DeleteCompteResponse.newBuilder()
                .setSuccess(deleted)
                .setMessage(deleted ? "Compte supprimé avec succès" : "Compte non trouvé")
                .build();
        
        responseObserver.onNext(response);
        responseObserver.onCompleted();
    }
}